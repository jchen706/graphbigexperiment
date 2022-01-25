
clang++ main.cpp betweenness.cu -c --cuda-path=/usr/local/cuda-10.1 --cuda-gpu-arch=sm_61 -L/usr/local/cuda-10.1/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v


clang++ -emit-llvm betweenness.cu --cuda-gpu-arch=sm_61 -O3 -c
clang++ -emit-llvm main.cpp --cuda-gpu-arch=sm_61 -O3 -c


/data/jchen/open_source_template/build/compilation/kernelTranslator betweenness-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc 
/data/jchen/open_source_template/build/compilation/hostTranslator betweenness-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc
llc --relocation-model=pic --filetype=obj  runtime_kernel_attr.bc
llc --relocation-model=pic --filetype=obj  gen_input.bc
llc --relocation-model=pic --filetype=obj  main.bc


g++ -g -Wall -L/data/jchen/open_source_template/build/runtime  -L/data/jchen/open_source_template/build/runtime/threadPool -o demo -fPIC -no-pie main.o host.o kernel.o runtime_kernel_attr.o gen_input.o -lc -lx86Runtime -lthreadPool -lpthread

