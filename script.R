data <- read.csv("prava.csv", header = TRUE, sep=",")



myfunction <-function(age, time, gender){
    X<-age+time
    
for (i in 1:(nrow(data)-4)){
        if((data[i,11]<=age) & (data[i+4,11]>age)){
            a<-i+1
        }
    }
for (j in 1:(nrow(data)-4)){
        if((data[j,11]<=X) & (data[j+4,11]>X)){
            b <- j
        }
    }
    
if(gender=="Male"){
    p<-sum(data[a:b,12]) 
}
else{
    p<-sum(data[a:b,13])
}
    return(p)
 
}



