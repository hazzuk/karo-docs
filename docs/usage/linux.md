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

## Shell

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

- **View**

    ```sh
    # view a file
    less file.txt
    ```

- **Edit**

    ```sh
    # edit a file
    micro file.txt
    ```

## System

- **Monitor**

    ```sh
    # monitor system resources
    btop
    ```

- **Disk Usage**

    ```sh
    # show disk usage by filesystem
    df -h -x tmpfs
    ```

- **Logs**

    ```sh
    # view the system logs
    sudo journalctl
    ```

- **Shutdown**

    ```
    # power off the system
    sudo shutdown now
    ```

- **Reboot**

    ```
    # restart the system
    sudo reboot
    ```

## Network

- **Ping**

    ```sh
    # ping a network host
    ping example.com
    ```

    ```sh
    # ping an ip address
    ping 192.168.0.1
    ```

## Help

- **Manuals** 

    ```sh
    # show a command manual
    man mkdir
    ```
