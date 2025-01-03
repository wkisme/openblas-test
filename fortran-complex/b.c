#include <stdio.h>

void cblas_cgemm(int Order, int TransA, int TransB, int M, int N, int K,
		void *alpha, void *A,  int lda,  void *B,  int ldb,  void *beta, void *C,  int ldc)
{
	printf("Order: %s\n", (sizeof(Order) == sizeof(int)) ? "int" : "unknown");
	printf("TransA: %s\n", (sizeof(TransA) == sizeof(int)) ? "int" : "unknown");
	printf("TransB: %s\n", (sizeof(TransB) == sizeof(int)) ? "int" : "unknown");
	printf("M: %s\n", (sizeof(M) == sizeof(int)) ? "int" : "unknown");
	printf("N: %s\n", (sizeof(N) == sizeof(int)) ? "int" : "unknown");
	printf("K: %s\n", (sizeof(K) == sizeof(int)) ? "int" : "unknown");

	// For the pointers, we can check if they are NULL or not, but their type is void*, so we'll print "void*"
	printf("alpha: %s\n", (alpha == NULL) ? "NULL" : "void*");
	printf("A: %s\n", (A == NULL) ? "NULL" : "void*");
	printf("B: %s\n", (B == NULL) ? "NULL" : "void*");
	printf("beta: %s\n", (beta == NULL) ? "NULL" : "void*");
	printf("C: %s\n", (C == NULL) ? "NULL" : "void*");

	printf("lda: %s\n", (sizeof(lda) == sizeof(int)) ? "int" : "unknown");
	printf("ldb: %s\n", (sizeof(ldb) == sizeof(int)) ? "int" : "unknown");
	printf("ldc: %s\n", (sizeof(ldc) == sizeof(int)) ? "int" : "unknown");

	printf("Order: %d\n", Order);
	printf("TransA: %d\n", TransA);
	printf("TransB: %d\n", TransB);
	printf("M: %d\n", M);
	printf("N: %d\n", N);
	printf("K: %d\n", K);


	printf("lda: %d\n", lda);
	printf("ldb: %d\n", ldb);
	printf("ldc: %d\n", ldc);

	// Print pointer values (assuming they point to complex data)
	printf("alpha: ");
	if (alpha != NULL) {
		// Assuming alpha is a pointer to a complex number (e.g., float complex *alpha)
		float *alpha_val = (float *)alpha;
		printf("%f\n", *alpha_val);  // Print the real part, assuming alpha is a float
		printf("%f\n", *(alpha_val+1));  // Print the real part, assuming alpha is a float
	} else {
		printf("NULL\n");
	}

	printf("A: ");
	float* ptr = A;

	// Print pointer and dereferenced values
	printf("Matrix A at %p with leading dimension %f %f %f %f\n", (void*)ptr, *(ptr+0), *(ptr+1), *(ptr+2), *(ptr+3));
	if (A != NULL) {
		// Assuming A is a pointer to a 2D matrix of type float (e.g., float *A)
		printf("Matrix A at %p with leading dimension %d\n", A, lda);
	} else {
		printf("NULL\n");
	}

	printf("B: ");
	if (B != NULL) {
		// Assuming B is a pointer to a 2D matrix of type float (e.g., float *B)
		printf("Matrix B at %p with leading dimension %d\n", B, ldb);
	} else {
		printf("NULL\n");
	}

	printf("beta: ");
	if (beta != NULL) {
		// Assuming beta is a pointer to a complex number (e.g., float complex *beta)
		float *beta_val = (float *)beta;
		printf("%f\n", *beta_val);  // Print the real part, assuming beta is a float
		printf("%f\n", *(beta_val + 1));  // Print the real part, assuming beta is a float
	} else {
		printf("NULL\n");
	}

	printf("C: ");
	if (C != NULL) {
		// Assuming C is a pointer to a 2D matrix of type float (e.g., float *C)
		printf("Matrix C at %p with leading dimension %d\n", C, ldc);
	} else {
		printf("NULL\n");
	}

	// Print the leading dimensions (lda, ldb, ldc)
	printf("lda: %d\n", lda);
	printf("ldb: %d\n", ldb);
	printf("ldc: %d\n", ldc);
}
