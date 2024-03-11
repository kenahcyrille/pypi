import os

def transfer_packages(source_dir, destination_dir, packages_list_file):
    # Check if the source directory exists
    if not os.path.isdir(source_dir):
        print(f"Source directory '{source_dir}' does not exist.")
        return
    
    # Create the destination directory if it doesn't exist
    if not os.path.exists(destination_dir):
        os.makedirs(destination_dir)
    
    # Read the list of packages from the file
    with open(packages_list_file, 'r') as f:
        packages_list = f.readlines()
    
    # Transfer each package to the destination directory
    transferred_packages = []
    for package in packages_list:
        package = package.strip()  # Remove leading/trailing whitespace
        source_package_path = os.path.join(source_dir, package)
        destination_package_path = os.path.join(destination_dir, package)
        
        # Check if the package exists in the source directory
        if os.path.exists(source_package_path):
            # Move the package to the destination directory
            os.rename(source_package_path, destination_package_path)
            transferred_packages.append(package)
        else:
            print(f"Package '{package}' not found in the source directory.")
    
    # Write the list of transferred packages to the file
    with open('transferred_packages.txt', 'w') as f:
        for package in transferred_packages:
            f.write(package + '\n')
    
    print("Transfer completed successfully.")

# Example usage:
source_directory = '/path/to/source/directory'
destination_directory = '/path/to/destination/directory'
packages_list_file = 'packages_list.txt'
transfer_packages(source_directory, destination_directory, packages_list_file)
