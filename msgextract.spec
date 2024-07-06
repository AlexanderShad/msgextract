Name: msgextract
Version: 0.1
Release: alt1

Summary: Easily extract the contents of MSG email files

License: GPLv2
Group: File tools
Url: https://github.com/AlexanderShad/msgextract.git

Source: %name-%version.tar

Requires: perl-Email-Outlook-Message-scripts mpack

BuildArch: noarch

%description
%summary

%prep
%setup

%build
%install
install -Dm755 %_builddir/%name-%version/%name.sh %buildroot%_bindir/%name

%files
%_bindir/%name

%changelog
* Sat Jul 06 2024 Aleksandr Shamaraev <mr.shad@> 0.1-alt1
- first build
