FROM jupyter/scipy-notebook

USER root
# python3 setup
RUN apt-get update && apt-get install -y graphviz
RUN conda install -y numpy scipy pandas h5py matplotlib toolz pytables
RUN conda install -y dask
RUN conda install -y -c conda-forge fastparquet

USER jovyan

RUN git clone https://github.com/dask/dask-tutorial.git ./dask-tutorial
RUN cd dask-tutorial && python prep.py && cd ..

RUN git clone https://github.com/dask/dask-examples.git ./dask-examples
