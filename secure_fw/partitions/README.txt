steps for redundancy:

1 step: Assign both MCUs, probably in the config file, a flag whether is a master or slave in
        communication enabled through max priority partitions

2 step: Master interrupts execution of slave to put ta communication working (Implement secure interrupt)