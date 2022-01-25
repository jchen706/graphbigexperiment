
# clang++ main.cpp bfs_topo_atomic.cu bfs_topo_frontier.cu bfs_topo_thread_centric.cu bfs_topo_unroll.cu bfs_topo_warp_centric.cu bfs_data_thread_centric.cu bfs_data_warp_centric.cu  -c --cuda-path=/usr/local/cuda-10.1 --cuda-gpu-arch=sm_61 -L/usr/local/cuda-10.1/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v

# clang++ -emit-llvm main.cpp --cuda-gpu-arch=sm_61 -O3 -c


# /data/jchen/open_source_template/build/compilation/kernelTranslator bfs_topo_atomic-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel_1.bc 
# /data/jchen/open_source_template/build/compilation/kernelTranslator bfs_topo_thread_centric-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel_2.bc 
# /data/jchen/open_source_template/build/compilation/kernelTranslator bfs_topo_frontier-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel_3.bc 
# /data/jchen/open_source_template/build/compilation/kernelTranslator bfs_topo_unroll-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel_4.bc 
# /data/jchen/open_source_template/build/compilation/kernelTranslator bfs_topo_warp_centric-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel_5.bc 
# /data/jchen/open_source_template/build/compilation/kernelTranslator bfs_data_thread_centric-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel_6.bc 
# /data/jchen/open_source_template/build/compilation/kernelTranslator bfs_data_warp_centric-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel_7.bc 

# /data/jchen/open_source_template/build/compilation/hostTranslator bfs_topo_atomic-host-x86_64-unknown-linux-gnu.bc host_1.bc 
# /data/jchen/open_source_template/build/compilation/hostTranslator bfs_topo_thread_centric-host-x86_64-unknown-linux-gnu.bc host_2.bc 
# /data/jchen/open_source_template/build/compilation/hostTranslator bfs_topo_frontier-host-x86_64-unknown-linux-gnu.bc host_3.bc 
# /data/jchen/open_source_template/build/compilation/hostTranslator bfs_topo_unroll-host-x86_64-unknown-linux-gnu.bc host_4.bc 
# /data/jchen/open_source_template/build/compilation/hostTranslator bfs_topo_warp_centric-host-x86_64-unknown-linux-gnu.bc host_5.bc 
# /data/jchen/open_source_template/build/compilation/hostTranslator bfs_data_thread_centric-host-x86_64-unknown-linux-gnu.bc host_6.bc 
# /data/jchen/open_source_template/build/compilation/hostTranslator bfs_data_warp_centric-host-x86_64-unknown-linux-gnu.bc host_7.bc 


# llc --relocation-model=pic --filetype=obj  kernel_1.bc
# llc --relocation-model=pic --filetype=obj  kernel_2.bc
# llc --relocation-model=pic --filetype=obj  kernel_3.bc
# llc --relocation-model=pic --filetype=obj  kernel_4.bc
# llc --relocation-model=pic --filetype=obj  kernel_5.bc
# llc --relocation-model=pic --filetype=obj  kernel_6.bc
# llc --relocation-model=pic --filetype=obj  kernel_7.bc

# llc --relocation-model=pic --filetype=obj  runtime_attr_kernel_1.bc
# llc --relocation-model=pic --filetype=obj  runtime_attr_kernel_2.bc
# llc --relocation-model=pic --filetype=obj  runtime_attr_kernel_3.bc
# llc --relocation-model=pic --filetype=obj  runtime_attr_kernel_4.bc
# llc --relocation-model=pic --filetype=obj  runtime_attr_kernel_5.bc
# llc --relocation-model=pic --filetype=obj  runtime_attr_kernel_6.bc
# llc --relocation-model=pic --filetype=obj  runtime_attr_kernel_7.bc

# llc --relocation-model=pic --filetype=obj  runtime_gen_input_kernel_1.bc
# llc --relocation-model=pic --filetype=obj  runtime_gen_input_kernel_2.bc
# llc --relocation-model=pic --filetype=obj  runtime_gen_input_kernel_3.bc
# llc --relocation-model=pic --filetype=obj  runtime_gen_input_kernel_4.bc
# llc --relocation-model=pic --filetype=obj  runtime_gen_input_kernel_5.bc
# llc --relocation-model=pic --filetype=obj  runtime_gen_input_kernel_6.bc
# llc --relocation-model=pic --filetype=obj  runtime_gen_input_kernel_7.bc

# llc --relocation-model=pic --filetype=obj  host_1.bc
# llc --relocation-model=pic --filetype=obj  host_2.bc
# llc --relocation-model=pic --filetype=obj  host_3.bc
# llc --relocation-model=pic --filetype=obj  host_4.bc
# llc --relocation-model=pic --filetype=obj  host_5.bc
# llc --relocation-model=pic --filetype=obj  host_6.bc
# llc --relocation-model=pic --filetype=obj  host_7.bc

# llc --relocation-model=pic --filetype=obj  main.bc

# KERNEL_FILES="kernel_*.o"
# HOST_FILES="host_*.o"
# GEN_INPUT="runtime_gen_input_kernel_*.o"
# ATTR="runtime_attr_kernel_*.o"

# echo $KERNEL_FILES
# echo $ATTR
# echo $HOST_FILES
# echo $GEN_INPUT
# g++ -g -Wall -L/data/jchen/open_source_template/build/runtime  -L/data/jchen/open_source_template/build/runtime/threadPool -o demo -fPIC -no-pie main.o $HOST_FILES $KERNEL_fILES $ATTR $GEN_INPUT -lc -lx86Runtime -lthreadPool -lpthread

