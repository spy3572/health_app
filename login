def login_user():
    name = entry_login_name.get()
    password = entry_login_password.get()

    if not name or not password:
        messagebox.showerror("Error", "Both fields are required!")
    elif name not in registered_users:
        messagebox.showerror("Error", "This user is not registered!")
    elif registered_users[name]['password'] != password:
        messagebox.showerror("Error", "Invalid password!")
    else:
        messagebox.showinfo("Success", f"Welcome, {name}!")
        login_window.destroy()  # Close the login window

def open_login_page():
    global login_window, entry_login_name, entry_login_password

    # Create the login window
    login_window = tk.Tk()
    login_window.title("User Login")
    login_window.geometry("400x200")

    # Labels and Entry fields
    tk.Label(login_window, text="Name:").pack(pady=5)
    entry_login_name = tk.Entry(login_window)
    entry_login_name.pack(pady=5)

    tk.Label(login_window, text="Password:").pack(pady=5)
    entry_login_password = tk.Entry(login_window, show="*")
    entry_login_password.pack(pady=5)

    # Login Button
    tk.Button(login_window, text="Login", command=login_user).pack(pady=20)

    login_window.mainloop()

# Open the login page
open_login_page()
