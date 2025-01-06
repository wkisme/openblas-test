program complex_gemm_example
        implicit none

        ! Declare matrix dimensions
        integer, parameter :: M = 2, N = 2, K = 2
        !integer, parameter :: M = 3, N = 3, K = 3
        integer :: i, j

        ! Declare matrices A, B, and C as single precision complex numbers
        complex :: A(M, K), B(K, N), C(M, N)
        complex(8) :: A1(M, K), B1(K, N), C1(M, N)

        ! Declare alpha and beta as single precision complex scalars
        complex(8) :: alpha, beta

        ! Declare the CBLAS interface with bind(c)
        ! void cblas_cgemm(OPENBLAS_CONST enum CBLAS_ORDER Order, OPENBLAS_CONST enum CBLAS_TRANSPOSE TransA, OPENBLAS_CONST enum CBLAS_TRANSPOSE TransB, OPENBLAS_CONST blasint M, OPENBLAS_CONST blasint N, OPENBLAS_CONST blasint K,
        !  OPENBLAS_CONST void *alpha, OPENBLAS_CONST void *A, OPENBLAS_CONST blasint lda, OPENBLAS_CONST void *B, OPENBLAS_CONST blasint ldb, OPENBLAS_CONST void *beta, void *C, OPENBLAS_CONST blasint ldc);

        ! Define the constants for CBLAS
        integer, parameter :: CblasRowMajor = 101
        integer, parameter :: CblasColMajor = 102
        integer, parameter :: CblasNoTrans = 111
        interface
                subroutine cblas_zgemm(Order, TransA, TransB, M, N, K, alpha, A, lda, B, ldb, beta, C, ldc) &
                                bind(c, name="cblas_zgemm")
                        use iso_c_binding
                        integer(c_int), value :: Order, TransA, TransB, M, N, K, lda, ldb, ldc
                        complex(c_double_complex) :: alpha,  beta
                        complex(c_double_complex) :: A(lda, K), B(K, ldb),C(ldc, N)
                end subroutine cblas_zgemm
        end interface


        ! Initialize matrices A and B (2x2 matrices)
        A = reshape([ (1.0, 1.0), (2.0, 2.0), &
                (3.0, 3.0), (4.0, 4.0) ], [M, K])

        B = reshape([ (5.0, 5.0), (6.0, 6.0), &
                (7.0, 7.0), (8.0, 8.0) ], [K, N])

        ! Initialize result matrix C to zero using reshape
        C = reshape([(0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0)], [M, N])

        do i =1,M
        do j=1,k
        A1(i,j) = cmplx(real(A(i,j)), aimag(A(i,j)),kind=8)
        end do
        end do 
        do i =1,K
        do j=1,N
        B1(i,j) = cmplx(real(B(i,j)), aimag(B(i,j)),kind=8)
        end do
        end do 
        do i =1,M
        do j=1,N
        C1(i,j) = cmplx(real(C(i,j)), aimag(C(i,j)),kind=8)
        end do
        end do 

        !print *,'A1', A1(1:M,1:k)

        ! Set alpha and beta
        alpha = (1.0, 0.0)  ! Complex scalar alpha = 1 + 0i
        beta = (0.0, 0.0)   ! Complex scalar beta = 0 + 0i

        ! Call cblas_cgemm to perform the matrix multiplication: C = alpha * A * B + beta * C
        !call cblas_cgemm(102, CblasNoTrans, CblasNoTrans, M, N, K, alpha, A, M, B, K, beta, C, M)
        call cblas_zgemm(102, CblasNoTrans, CblasNoTrans, M, N, K, alpha, A1, M, B1, K, beta, C1, M)

        ! Print the result matrix C
        print *, "Resultant Matrix C (2x2 complex):"
        do i = 1, M
        write(*,'(2F12.4)') real(C1(i,1)), aimag(C1(i,1)), real(C1(i,2)), aimag(C1(i,2))
        end do

end program complex_gemm_example

