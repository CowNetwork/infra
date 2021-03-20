import subprocess

bla = subprocess.run(['terraform', '-chdir=tf', 'state', 'pull'], capture_output=True, text=True)

print(bla.stdout)
