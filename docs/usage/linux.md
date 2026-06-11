---
icon: simple/linux
---

# Linux

The following is a list of essential commands and shortcuts for using a Linux server.

## Terminal

- **Copy** selected terminal text

    ++ctrl+shift+c++

- **Paste** clipboard into the terminal

    ++ctrl+shift+v++

- **Recall** commands from shell history

    ++arrow-up++ or ++arrow-down++

- **Autocomplete** file, directory, and command names

    ++tab++

## Remote Access

- **SSH**

    ```sh
    # connect to a remote server
    ssh -A karo@homeserver.example.com
    ```

## Shell session

- **Exit**

    ```sh
    # close shell session
    exit
    ```

- **History**

    ```sh
    # show previous commands
    history
    ```

## Text files

- **File viewer**

    ```sh
    # view file
    less file.txt
    ```

- **Text editor**

    ```sh
    # create/edit file
    micro file.txt
    ```

## System

- **Monitoring**

    ```sh
    # view system usage
    btop
    ```

- **Disk Usage**

    ```sh
    # show disk usage
    df -h -x tmpfs
    ```

- **Logs**

    ```sh
    # view system logs
    sudo journalctl
    ```

- **Shutdown**

    ```sh
    # power off system
    sudo shutdown now
    ```

- **Reboot**

    ```sh
    # restart system
    sudo reboot
    ```

## Networking

- **Ping**

    ```sh
    # ping network host
    ping example.com
    ```

    ```sh
    # ping ip address
    ping 192.168.0.1
    ```

## Help

- **Manuals** 

    ```sh
    # view command manual
    man micro
    ```
