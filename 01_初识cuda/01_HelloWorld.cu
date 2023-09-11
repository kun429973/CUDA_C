#include <stdio.h>

__host__ __device__ void hello_from_hostANDdevice() {
    printf("Hello World from hostANDdevice!\n");
}


__device__ void hello_from_device() {
    printf("Hello World from device!\n");
}

__global__ void hello_from_global() {
    printf("Hello World from global!\n");
    hello_from_device();
    hello_from_hostANDdevice();
}

int main(void) {
    hello_from_global<<<1, 1>>>();
    cudaDeviceSynchronize(); 
    printf("__host__端 log:\n");
    hello_from_hostANDdevice();
    
}
