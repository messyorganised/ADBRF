# ADBRF
A powershell script that will run one of the ad broker fix. This script may resolve issues where your M365 program is stuck in a login loop by 'removing' (rename) the aadbroker folder and microsoft access control folder.
Doing so will force the application to recreate these two folders from fresh; possibly resolving any issues that the original folders were causing. 
