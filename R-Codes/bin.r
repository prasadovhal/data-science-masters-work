#decimal to binary
s <- function(n) 
{
        if(n > 1) 
         {
           s(as.integer(n/2))
         }
        cat(n %% 2)
        is.(cat(n %% 2))
}
