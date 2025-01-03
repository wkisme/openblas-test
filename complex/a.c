#include <stdio.h>
#include <cblas.h>
#include <complex.h>

int main() {
    // Define matrix dimensions
    int M = 2, N = 2, K = 2;

    // Define alpha and beta (scalars)
    float complex alpha = 1.0f + 0.0f*I;  // Complex scalar alpha = 1 + 0i
    float complex beta = 0.0f + 0.0f*I;   // Complex scalar beta = 0 + 0i

    // Define matrices A, B, and C (each 2x2 complex matrix)
    // Note: Each element is a complex number (real + imaginary)
    float complex A[4] = { 
        1.0f + 1.0f*I, 2.0f + 2.0f*I,
        3.0f + 3.0f*I, 4.0f + 4.0f*I
    };
    float complex B[4] = {
        5.0f + 5.0f*I, 6.0f + 6.0f*I,
        7.0f + 7.0f*I, 8.0f + 8.0f*I
    };
    float complex C[4] = { 0.0f + 0.0f*I, 0.0f + 0.0f*I, 0.0f + 0.0f*I, 0.0f + 0.0f*I };

    // Perform the matrix multiplication: C = alpha * A * B + beta * C
    //cblas_cgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, M, N, K, 
    cblas_cgemm(102, 111, 111, M, N, K, 
                &alpha, (void*)A, K, (void*)B, N, &beta, (void*)C, N);

    // Print the resulting matrix C (the result of the multiplication)
    printf("Resultant Matrix C (2x2 complex):\n");
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            printf("(%f + %fi) ", crealf(C[i*N + j]), cimagf(C[i*N + j]));
        }
        printf("\n");
    }

    return 0;
}

