# Sample .NET Application

A simple .NET 8.0 console application that demonstrates basic functionality and can be built and deployed using GitHub Actions and Octopus Deploy.

## Features

- .NET 8.0 console application
- Displays system information
- Version information
- Command line argument support
- Ready for CI/CD pipeline

## Building Locally

```bash
# Navigate to the application directory
cd dotnet-app

# Restore dependencies
dotnet restore

# Build the application
dotnet build

# Run the application
dotnet run

# Build for release
dotnet build --configuration Release

# Publish the application
dotnet publish --configuration Release --output ./publish
```

## Application Output

When you run the application, you'll see output like:

```
=== Sample .NET Application ===
Application Version: 1.0.0
Current Time: 12/18/2023 10:30:45 AM
Machine Name: DESKTOP-ABC123
OS Version: Microsoft Windows NT 10.0.19045.0
.NET Version: 8.0.0

Press any key to exit...
```

## Project Structure

```
dotnet-app/
├── Program.cs              # Main application code
├── SampleDotNetApp.csproj  # Project file
└── README.md              # This documentation
```

## Deployment

This application is designed to be built and deployed using:
- GitHub Actions for CI/CD
- Octopus Deploy for deployment automation
- NuGet package format for distribution 