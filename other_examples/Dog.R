# create a dog "structure" with 3 methods and 4 properties
#
dog <- function(name = "Fido", owner = "Bob", barkType = "Woof!", age = 3) {
        noOfBarks <- 5
        
        # methods for function
        swatWithNewspaper <- function() {
                cat("Yelp!\n")
                noOfBarks <<- sample(3:10, 1)
        }
        
        bark <- function() {
                for (i in 1:noOfBarks) cat(barkType)
        }
        
        info <- function() {
                cat(paste("Name: ", name))
                cat(paste("\nOwner: ", owner))    
                cat(paste("\nAge: ", age))
                cat("\n")
        }
        
        # specifies methods accessible with $ operator
        list(swatWithNewspaper = swatWithNewspaper, bark = bark, info = info)
}


# create 2 dogs
snookums <- dog(name = "Snookums", owner = "Granny Smith", barkType = "Yap!", age = 12)
fido <- dog()

# access methods
snookums$info()
fido$info()
snookums$bark()
fido$bark()
snookums$swatWithNewspaper()


# The function dog is like a plan of data and functionality we would like our
# defined objects to have. In assignment 2, the makeVector function can be seen
# as a plan for a new type of vector, since we want some functionality (namely
# cacheing) that the basic R vector doesn't have innately. The properties (name,
# owner, barkType, age, noOfBarks) and the methods (swatWithNewspaper, bark,
# info) that we would like to be able to access (using the $ sign), we put in
# the list that is returned by dog. For example, we got "Fido" to bark using
# 
# fido$bark()
# 
# The property age, however, is not included in the list, so the following code
# would not work:
# 
# fido$age
