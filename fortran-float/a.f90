program matrix_multiplication
    implicit none

    integer, parameter :: M = 2, N = 2, K = 2
    real(4) :: A(2, 2), B(2, 2), C(2, 2)
    real(4) :: alpha, beta

    ! Initialize alpha and beta
    alpha = 1.0
    beta = 0.0

    ! Initialize matrices A, B, and C
    A = reshape([1.0, 2.0, 3.0, 4.0], [2, 2])
    B = reshape([5.0, 6.0, 7.0, 8.0], [2, 2])
    C = 0.0

    ! Perform matrix multiplication: C = alpha * A * B + beta * C
    call sgemm('N', 'N', M, N, K, alpha, A, M, B, K, beta, C, M)

    ! Print the result matrix C
    print *, 'Matrix C:'
    print *, C

end program matrix_multiplication

