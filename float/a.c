#include <stdio.h>
#include <cblas.h>

int main() {
    // Define matrix dimensions
    int M = 2, N = 2, K = 2;

    // Define alpha and beta
    float alpha = 1.0f;
    float beta = 0.0f;

    // Define matrices A, B, and C
    float A[4] = {1.0f, 2.0f, 3.0f, 4.0f};  // 2x2 matrix
    float B[4] = {5.0f, 6.0f, 7.0f, 8.0f};  // 2x2 matrix
    float C[4] = {0.0f, 0.0f, 0.0f, 0.0f};  // 2x2 matrix (result)

    // Perform the matrix multiplication C = alpha * A * B + beta * C
    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, M, N, K, 
                alpha, A, K, B, N, beta, C, N);

    // Print the result matrix C
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            printf("%f ", C[i*N + j]);
        }
        printf("\n");
    }

    return 0;
}

