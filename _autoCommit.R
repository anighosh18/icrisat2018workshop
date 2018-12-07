library("tcltk2")
library("git2r")

# setup
cred <- cred_ssh_key("C:/Users/anighosh/.ssh/id_rsa.pub", 
                     "C:/Users/anighosh/.ssh/id_rsa")

config(repo, user.name = "anighosh18", user.email = "ani.ucdavis@gmail.com")

autoUpdate <- function(){
  # current repo
  repo <- repository(".")
  add(repo, path = ".")
  st <- status(repo)
  if (length(st$staged$modified) > 0){
    cmsg <- paste("autoupdating ",Sys.time())
    commit(repo, message = cmsg)
    push(repo, credentials = cred)
  }
}

tclTaskSchedule(wait = 10000, autoUpdate(), id = "updating", redo = TRUE)

# to stop
tclTaskDelete("updating")