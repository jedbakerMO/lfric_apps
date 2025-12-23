##############################################################################
# (c) Crown copyright 2017 Met Office. All rights reserved.
# The file LICENCE, distributed with this code, contains details of the terms
# under which the code may be used.
##############################################################################

$(info UM physics project specials)

export PRE_PROCESS_INCLUDE_DIRS = \
        $(WORKING_DIR)/atmosphere_service/include \
        $(WORKING_DIR)/boundary_layer/include \
        $(WORKING_DIR)/large_scale_precipitation/include \
        $(WORKING_DIR)/free_tracers/include

export PRE_PROCESS_MACROS += UM_PHYSICS LFRIC USSPPREC_32B LSPREC_32B UM_JULES

ifdef USE_VERNIER
  export PRE_PROCESS_MACROS += VERNIER
  $(info VERNIER ON)

ifdef USE_PSYDATA_PROFILING_KERNELS
  export PSYDATA_PROFILE_COMMAND+= --profile kernels
  export PRE_PROCESS_MACROS += PSYDATA_PROFILE
  $(info PSYDATA_KERNELS ON)
endif
ifdef USE_PSYDATA_PROFILING_INVOKES
  export PSYDATA_PROFILE_COMMAND+= --profile invokes
  export PRE_PROCESS_MACROS += PSYDATA_PROFILE
endif

ifndef USE_PSYDATA_PROFILING_KERNELS
ifndef USE_PSYDATA_PROFILING_INVOKES
  export PSYDATA_PROFILE_COMMAND+=
endif
endif
$(info PSYDATA COMMAND: $(PSYDATA_PROFILE_COMMAND))
endif
