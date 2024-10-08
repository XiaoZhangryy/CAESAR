% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/caesar.R
\name{cellembedding_matrix}
\alias{cellembedding_matrix}
\title{Compute Spatial-Aware Cell Embeddings}
\usage{
cellembedding_matrix(X, adjm, q = 50, reduction.name = "caesar", ...)
}
\arguments{
\item{X}{A gene-by-cell matrix (e.g., the `data` slot from a Seurat object) that serves as the input data for dimensional reduction.}

\item{adjm}{A spatial adjacency matrix representing the relationships between cells or spots in spatial transcriptomic data.}

\item{q}{An integer specifying the number of dimensions to reduce to. Default is 50.}

\item{reduction.name}{A character string specifying the name of the dimensional reduction method. Default is 'caesar'.}

\item{...}{Additional parameters passed to `ProFAST::FAST_run`.}
}
\value{
A matrix containing the computed cell embeddings. The number of rows corresponds to the number of cells, and the number of columns corresponds to the specified number of dimensions (`q`).
}
\description{
This function computes low-dimensional cell embeddings from a gene-by-cell matrix. The method initializes cell embeddings using approximate PCA and refines them through a linear factor model nested a intrinsical conditional autoregressive model.
}
\examples{
data(toydata)

seu <- toydata$seu
pos <- toydata$pos

adjm <- ProFAST::AddAdj(as.matrix(pos), radius.upper = 200)
X <- Seurat::GetAssayData(object = seu, slot = "data", assay = "RNA")
cellembedding <- cellembedding_matrix(
    X = X,
    adjm = adjm
)
print(cellembedding[1:3, 1:3])
}
\seealso{
\code{\link[ProFAST]{FAST_run}} for the main FAST dimensionality reduction algorithm.
}
