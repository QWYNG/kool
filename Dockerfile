FROM runtimeverificationinc/kframework-k:ubuntu-jammy-6.0.16
WORKDIR /work_dir
CMD ["/bin/bash"]
# docker build -t my-kframework-dev .
# docker run -it -v (pwd)/src:/work_dir/src my-kframework-dev