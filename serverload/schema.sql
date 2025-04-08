DROP TABLE IF EXISTS serverload;


CREATE TABLE serverload (

    time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- CPU data get with `system_profiler SPHardwareDataType`
    cpu_user REAL,
    cpu_system REAL,
    cpu_idle REAL,

    -- Physical Memory
    memory_available BIGINT, --GB

    -- GPU data
    -- NOT FOUND

    --Disk data
    disk_read BIGINT, --bytes
    disk_write BIGINT, --bytes

    -- Network data
    net_sent BIGINT, --ms
    net_recv BIGINT --Mbps
);



