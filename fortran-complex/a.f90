program complex_gemm_example
    implicit none

    ! Declare matrix dimensions
    integer, parameter :: M = 2, N = 2, K = 2
    !integer, parameter :: M = 3, N = 3, K = 3
    integer :: i, j

    ! Declare matrices A, B, and C as single precision complex numbers
    complex :: A(M, K), B(K, N), C(M, N)

    ! Declare alpha and beta as single precision complex scalars
    complex :: alpha, beta

    ! Declare the CBLAS interface with bind(c)
    ! void cblas_cgemm(OPENBLAS_CONST enum CBLAS_ORDER Order, OPENBLAS_CONST enum CBLAS_TRANSPOSE TransA, OPENBLAS_CONST enum CBLAS_TRANSPOSE TransB, OPENBLAS_CONST blasint M, OPENBLAS_CONST blasint N, OPENBLAS_CONST blasint K,
    !  OPENBLAS_CONST void *alpha, OPENBLAS_CONST void *A, OPENBLAS_CONST blasint lda, OPENBLAS_CONST void *B, OPENBLAS_CONST blasint ldb, OPENBLAS_CONST void *beta, void *C, OPENBLAS_CONST blasint ldc);

    ! Define the constants for CBLAS
    integer, parameter :: CblasRowMajor = 101
    integer, parameter :: CblasColMajor = 102
    integer, parameter :: CblasNoTrans = 111
        interface
                subroutine cblas_cgemm(Order, TransA, TransB, M, N, K, alpha, A, lda, B, ldb, beta, C, ldc) &
                                bind(c, name="cblas_cgemm")
                        use iso_c_binding
                        integer(c_int), value :: Order, TransA, TransB, M, N, K, lda, ldb, ldc
                        complex(c_float_complex) :: alpha,  beta
                        complex(c_float_complex) :: A(lda, K), B(K, ldb),C(ldc, N)
                end subroutine cblas_cgemm
        end interface


    ! Initialize matrices A and B (2x2 matrices)
    A = reshape([ (1.0, 1.0), (2.0, 2.0), &
                  (3.0, 3.0), (4.0, 4.0) ], [M, K])

    B = reshape([ (5.0, 5.0), (6.0, 6.0), &
                  (7.0, 7.0), (8.0, 8.0) ], [K, N])

    ! Initialize result matrix C to zero using reshape
    C = reshape([(0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0)], [M, N])

    ! Set alpha and beta
    alpha = (1.0, 0.0)  ! Complex scalar alpha = 1 + 0i
    beta = (0.0, 0.0)   ! Complex scalar beta = 0 + 0i

    ! Call cblas_cgemm to perform the matrix multiplication: C = alpha * A * B + beta * C
    call cblas_cgemm(102, CblasNoTrans, CblasNoTrans, M, N, K, alpha, A, M, B, K, beta, C, M)

    ! Print the result matrix C
    print *, "Resultant Matrix C (2x2 complex):"
    do i = 1, M
        write(*,'(2F12.4)') real(C(i,1)), aimag(C(i,1)), real(C(i,2)), aimag(C(i,2))
    end do

end program complex_gemm_example

