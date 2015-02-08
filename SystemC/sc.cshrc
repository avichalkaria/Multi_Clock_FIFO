source ~/vlsi_tools.csh
source ~ee577/setup.IC6
if ($PATH !~ */usr/local/cadence/MMSIM71/bin*) \
    setenv PATH /usr/local/cadence/MMSIM71/bin:/usr/local/cadence/MMSIM71/tools/bin:/usr/local/cadence/MMSIM71/tools/dfII/bin:$PATH

if ( ! $?LM_LICENSE_FILE ) then
    setenv LM_LICENSE_FILE 1800\@license29.usc.edu
else
    if ($LM_LICENSE_FILE !~ *1800@license29.usc.edu*) \
        setenv LM_LICENSE_FILE 1800\@license29.usc.edu:$LM_LICENSE_FILE
endif

#
# $Header: /src/common/usc/skel/RCS/dot.cshrc,v 1.5 1994/06/20 20:48:05 ucs Exp $
#

#
# If this is not an interactive shell, then we exit here.
#
if (! $?prompt) then
	exit 0
endif

#
# RC Revision Date
#
set rcRevDate=930824

#
# Set User Level of expertise.
#
set UserLevel=novice

###############################################################################
#
# Source a global .cshrc file.  
#
# DO NOT DELETE THIS SECTION!
#
# If you wish to customize your own environment, then add things AFTER
# this section.  In this way, you may override certain default settings,
# but still receive the system defaults.
#
if (-r /usr/lsd/conf/master.cshrc) then
	source /usr/lsd/conf/master.cshrc
else if (-r /usr/local/lib/master.cshrc) then
	source /usr/local/lib/master.cshrc
endif
###############################################################################

#
# Put your changes/additions, here.
#

setenv CDK_DIR /home/scf-22/ee577/design_pdk/ncsu-cdk-1.6.0.beta
setenv CDS_Netlisting_Mode Analog

