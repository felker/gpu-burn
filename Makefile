CUDAPATH=/usr/local/cuda

# Have this point to an old enough gcc (for nvcc)
GCCPATH=/usr

NVCC=${CUDAPATH}/bin/nvcc
CCPATH=${GCCPATH}/bin

drv:
	nvcc -ptx compare.cu -o compare.ptx
	g++ -O3 -Wno-unused-result -c gpu_burn-drv.cpp
	g++ -o gpu_burn gpu_burn-drv.o -O3 -lcuda -lcublas -lcudart -o gpu_burn

clean:
	rm -rf gpu_burn *.o *.ptx

