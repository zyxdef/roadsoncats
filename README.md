# roadsoncats
Measuring the effect of road density on the distribuition of some feline species on Brazil

## Initial Plan
Since 

1. species distribution estimates obtained with [`Maxent`][maxent] software 
  are going to be considered the reference for this study and 
2. already were obtained by the researcher,

then the modelling steps will be

1. modelling species distribution in R with the package [`maxnet`][maxnet]
  (which uses glm on the regressors with some penalty function)
2. comparing the estimates obtained above with the estimates obtained with Maxent
3. figuring out the penalty function
4. building an equivalent Bayesian regression model
5. comparing the estimates above with the two above
6. expanding the Bayesian regression model above into an hierarchical model, 
  in order to include dependence among the regressors
7. generating graphical output on the model above
8. evaluating the direct and indirect effects of road density on the species distributions.

[maxent]: https://onlinelibrary.wiley.com/doi/pdf/10.1111/j.1600-0587.2013.07872.x
[maxnet]: https://cran.r-project.org/web/packages/maxnet/index.html
