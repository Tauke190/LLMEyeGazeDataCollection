#!/usr/bin/env python3
import psutil
import time
import sqlite3


def trackload():
    while True:

        # CPU
        cpu = psutil.cpu_times()
        # print(cpu.user)
        # print(cpu.system)
        # print(cpu.idle)

        # Memory
        memory = psutil.virtual_memory() # rely on total and available fields
        # print(memory.available)


        # Disk Usage
        disk = psutil.disk_io_counters(perdisk=False)
        # print(disk.read_count)
        # print(disk.write_count)

        # Network
        network = psutil.net_io_counters(pernic=False, nowrap=True)
        # print(network.bytes_sent)
        # print(network.bytes_recv)
        # print("===============================")

        with sqlite3.connect("specs.db") as con:
            cur = con.cursor()
            cur.execute("INSERT INTO serverload (cpu_user, cpu_system, cpu_idle, memory_available, disk_read, disk_write, net_sent, net_recv) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", (cpu.user, cpu.system, cpu.idle, memory.available, disk.read_count, disk.write_count, network.bytes_sent, network.bytes_recv))
            con.commit()
            print("Machine Load successfully recorded!")

        time.sleep(10)


trackload()
