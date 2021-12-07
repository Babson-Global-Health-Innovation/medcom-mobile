# Codename MEDCOM: Technical Documentation

Medical Communication between deaf patients and their providers.

| Author                 | Project Documentation                                                                                          |
| ---------------------- | -------------------------------------------------------------------------------------------------------------- |
| Pujit Mehrotra @pujitm | [Google Doc](https://docs.google.com/document/d/16ROadBl7y1eWteVPUeHejW2OV5tgC0HuGxhGBRTrgR0/edit?usp=sharing) |

The Project Documentation Google Doc contains history and thought process that led to this project.

## Team

| Name | Email | Phone Number | Github Handle |
| ---- | ----- | ------------ | ------------- |

Put your team & Github handles/emails/numbers here

## Purpose & Need

Illiterate deaf patients in rural Rwanda need to convey and receive information
to make decisions about medical treatment and increase their standard of living.

## What the app does

Presents large images of medical symptoms and two buttons beneath it: a green checkmark for “yes, i have this symptom” and a red cross for “no, this doesn’t apply”.

A user must press one of these buttons to continue. When they do, another image will be shown, with the same buttons.

Once all of the images have been shown, a list of symptoms that the patient has will appear on the screen. This screen can be screenshot or copied to the clipboard.

Then, the user can return to the home screen and start the process all over again.

## Building and delivering application

1. Make sure you have the required dependencies by running `flutter doctor -v` (verbose version--this will help you get better help online).
2. Run the command `flutter build apk`.
3. Find `app-release.apk` in `./build/app/outputs/apk/release`
4. Upload it to the shared UGHE drive under the `App Releases` folder.
5. Email or text UGHE team to download/install update from google drive

## Important files

Source code is located in `lib` directory.

- `main.dart` is program entry
- `images.dart` defines images of symptoms that will be shown to users. Make changes to image set here.

See in-code comments for additional documentation.

## Setting Up the Project

Prerequisites: Flutter & Git (see sections below if you're confused). Note that all commands are for \*nix terminals/shells.

1. Join the [Babson Global Health Innovation GitHub org](https://github.com/Babson-Global-Health-Innovation) and get Commit privileges
2. Clone the project: `git clone https://github.com/Babson-Global-Health-Innovation/medcom-mobile.git`
3. Navigate inside the project directory. (e.g. `cd medcom-mobile`)
4. Open a phone simulator (i.e. via android studio. Run `open -a Simulator` if you're on a Mac)
5. Run `flutter run`. This will download project dependencies and launch the app in the simulator.
6. Create a branch for your own work, commit/push to it, and open a pull request.
7. Review pull-requests and merge if everything looks good.

## Learning Flutter

Flutter is a mobile app development framework.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Learning Git

Git is a source code versioning system.

A few resources to get you started if this is your first time using git:

- [Using Git for the first time](https://docs.github.com/en/get-started/quickstart/set-up-git)
- [Learning Git Basics](https://learngitbranching.js.org/)

For help getting started with Git and Github, follow
[Introduction to GitHub](https://lab.github.com/githubtraining/introduction-to-github), which will teach you how to

- Communicate in issues
- Manage notifications
- Create branches
- Make commits
- Introduce changes with pull requests

All of which are relevant to this project.
