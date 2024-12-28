# qubefetch
custom fetch scripts for QubesOS

# instructions

1. Download the qubesfetch script (make sure you are in the home directory)

`wget https://raw.githubusercontent.com/tillay8/qubefetch/refs/heads/main/qubesfetch&&chmod +x qubesfetch`

2. Download the fetchinfo.sh script

`https://raw.githubusercontent.com/tillay8/qubefetch/refs/heads/main/fetchinfo.sh&&chmod +x ~/fetchinfo.sh`

3. Move fetchinfo.sh script into dom0

`qvm-run --pass-io <qube-you-downloaded-in> 'cat ~/fetchinfo.sh' > fetchinfo.sh`

4. Make a keyboard shortcut to reload dom0-only fetch infos (and bind it to something)

`/home/<your-dom0-user>/fetchinfo.sh personal school work`

To use:

1. press the keybind to get dom0 fetch infos

2. run ~/qubesfetch

3. gawk at your pretty system
