library(argparser)
library(Spectre)

parser <- argparser::arg_parser(description='run.umap function parser')

parser <- add_argument(parser, arg = '--dat', type = 'character', default = NULL, help = 'Input data.table or data.frame')
parser <- add_argument(parser, arg = '--use.cols', type = 'character', default = NULL, help = 'Vector of column names or numbers for clustering')
parser <- add_argument(parser, arg = '--umap.x.name', type = 'character', default = 'UMAP_X', help = 'Name of UMAP x-axis')
parser <- add_argument(parser, arg = '--umap.y.name', type = 'character', default = 'UMAP_Y', help = 'Name of UMAP y-axis')
parser <- add_argument(parser, arg = '--umap.seed', type = 'integer', default = 42, help = 'Seed value for reproducibility')
parser <- add_argument(parser, arg = '--neighbours', type = 'integer', default = 15, help = 'Number of nearest neighbours')
parser <- add_argument(parser, arg = '--n_components', type = 'integer', default = 2, help = 'Number of dimensions for output results')
parser <- add_argument(parser, arg = '--metric', type = 'character', default = 'euclidean', help = 'Determines how distances between data points are computed, can also be "manhattan"')
parser <- add_argument(parser, arg = '--n_epochs', type = 'integer', default = 200, help = 'Number of iterations performed during layout optimisation')
parser <- add_argument(parser, arg = '--input', type = 'character', default = 'data', help = 'Determines whether primary input argument is a data or distance matrix, can also be "dist"')
parser <- add_argument(parser, arg = '--init', type = 'character', default = 'spectral', help = 'Default "spectral" computes an initial embedding using eigenvectors of the connectivity graph matrix, can also use "random" (creates an initial layout based on random coordinates)')
parser <- add_argument(parser, arg = '--min_dist', type = 'double', default = 0.1, help = 'Determines how close points appear in final layout')
parser <- add_argument(parser, arg = '--set_op_mix_ratio', type = 'double', default = 1, help = 'Determines how the knn-graph is used to create a fuzzy simplicial graph')
parser <- add.argument(parser, arg = '--local_connectivity', type = 'double', default = 1, help = 'Used during construction of fuzzy simplicial set')
parser <- add.argument(parser, arg = '--bandwidth', type = 'double', default = 1, help = 'Used during construction of fuzzy simplicial set')
parser <- add_argument(parser, arg = '--alpha', type = 'double', default = 1, help = 'Initial value of "learning rate" of layout optimisation')
parser <- add_argument(parser, arg = '--gamma', type = 'double', default = 15, help = 'Together with alpha, it determines the learning rate of layout optimisation')
parser <- add_argument(parser, arg = '--negative_sample_rate', type = 'double', default = 5, help = ' Determines how many non-neighbour points are used per point and per iteration during layout optimisation')
parser <- add_argument(parser, arg = '--a_gradient', type = 'double', default = NA, help = 'Contributes to gradient calculations during layout optimisation: when left at NA, a suitable value will be estimated automatically')
parser <- add_argument(parser, arg = '--b_gradient', type = 'double', default = NA, help = 'Contributes to gradient calculations during layout optimisation: when left at NA, a suitable value will be estimated automatically')
parser <- add_argument(parser, arg = '--spread', type = 'double', default = 1, help = 'Used during automatic estimation of a_gradient/b_gradient parameters')
parser <- add_argument(parser, arg = '--transform_state', type = 'integer', default = 42, help = 'Seed for random number generation used during predict()')
parser <- add_argument(parser, arg = '--knn.repeats', type = 'integer', default = 1, help = 'Number of times to restart knn search')
parser <- add_argument(parser, arg = '--verbose', type = 'logical', default = 'TRUE', help = 'Determines wether to show progress messages')
parser <- add_argument(parser, arg = '--umap_learn_args', type = 'double', default = NA, help = 'Vector of arguments to python package  umap-learn')

args <- parse_args(parser)

dat <- read.csv(args$dat)

use.cols <- read.csv(args$use.cols)

result <- run.umap(dat = dat, 
                   use.cols = use.cols, 
                   umap.x.name = args$umap.x.name, 
                   umap.y.name = args$umap.y.name, 
                   umap.seed = args$umap.seed, 
                   neighbours = args$neighbours, 
                   n_components = args$n_components, 
                   metric = args$metric, 
                   n_epochs = args$n_epochs, 
                   input = args$input, 
                   init = args$init, 
                   min_dist = args$min_dist, 
                   set_op_mix_ratio = args$set_op_mix_ratio, 
                   local_connectivity = args$local_connectivity, 
                   bandwidth = args$bandwidth, 
                   alpha = args$alpha, 
                   gamma = args$gamma, 
                   negative_sample_rate = args$negative_sample_rate, 
                   a_gradient = args$a_gradient, 
                   b_gradient = args$b_gradient, 
                   spread = args$spread, 
                   transform_state = args$transform_state, 
                   knn.repeats = args$knn.repeats, 
                   verbose = args$verbose, 
                   umap_learn_args = args$umap_learn_args)

