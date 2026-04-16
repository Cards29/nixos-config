{ config, pkgs, ... }:

{
  # Define the swap device matching your lsblk output
  swapDevices = [{
    device = "/dev/mapper/luks-c8286c88-1d79-44fb-88ba-5517c29e95a8";
  }];

  boot = {
    # 1. Point the kernel to the unlocked swap partition for resume
    kernelParams = [ "resume=/dev/mapper/luks-c8286c88-1d79-44fb-88ba-5517c29e95a8" ];

    # 2. Ensure the resume device is recognized in the initrd phase
    resumeDevice = "/dev/mapper/luks-c8286c88-1d79-44fb-88ba-5517c29e95a8";
  };

  # 3. Logind configuration using the new structured settings
  services.logind = {
    settings.Login.HandleLidSwitch = "suspend-then-hibernate";
    settings.Login.HandleLidSwitchExternalPower = "suspend";
    settings = {
      Login = {
        HibernateDelaySec = "600";
      };
    };
  };

  # 4. DMS Lockscreen Integration
  # powerManagement.powerDownCommands = ''
  #   ${pkgs.dms-shell}/bin/dms ipc call lock lock
  # '';
}
