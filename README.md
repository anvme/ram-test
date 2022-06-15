
# RAM Test for ubuntu




## Installation

Install sysbench

```bash
  apt install -y sysbench
```

Download script

```bash
  wget https://raw.githubusercontent.com/anvme/ram-test/master/ramtest.sh && chmod +x ramtest.sh
```

Run it

```bash
  /bin/bash ./ramtest.sh
```

Sample results
```bash
sysbench RAM Speed Tests:
---------------------------------
Block Size | 4k       (Memory access mode) | 512k      (Memory access mode)
  ------   | ---                     ----  | ----                     ---- 
Read       | 13456.52 MiB/sec        (Seq) | 15378.79 MiB/sec         (Seq)
Write      | 9115.85 MiB/sec         (Seq) | 14675.65 MiB/sec         (Seq)
Read       | 1492.87 MiB/sec         (Rnd) | 1604.13 MiB/sec          (Rnd)
Write      | 1453.61 MiB/sec         (Rnd) | 1597.15 MiB/sec          (Rnd)
           |                               |                               
Block Size | 64k      (Memory access mode) | 1M        (Memory access mode)
  ------   | ---                     ----  | ----                     ---- 
Read       | 16719.72 MiB/sec        (Seq) | 14586.64 MiB/sec         (Seq)
Write      | 14214.41 MiB/sec        (Seq) | 14789.61 MiB/sec         (Seq)
Read       | 1634.15 MiB/sec         (Rnd) | 1586.62 MiB/sec          (Rnd)
Write      | 1622.86 MiB/sec         (Rnd) | 1594.47 MiB/sec          (Rnd)
```