# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG REGISTRY=quay.io
ARG OWNER=jupyter
ARG BASE_IMAGE=$REGISTRY/$OWNER/minimal-notebook:afe30f0c9ad8
FROM $BASE_IMAGE

COPY conda-lock.yml /tmp/conda-lock.yml

RUN conda env update --quiet --file /tmp/conda-lock.yml --name base \
    && conda clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"
