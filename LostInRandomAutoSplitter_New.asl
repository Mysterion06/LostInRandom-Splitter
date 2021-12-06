// Loadremover and start by Mysterion_06_
state("Lost In Random"){
    byte LRT: "GameAssembly.dll", 0x1F635A32;
    byte start: "GameAssembly.dll", 0x031F9980, 0xB8, 0xC0, 0x110, 0x20, 0x10, 0x78;
}

/*init{
    var pattern = new SigScanTarget("54 5C 9A F0 00 13 00 88");

    vars.gameOffset = IntPtr.Zero;
    int scanAttempts = 10;
    while (scanAttempts-- > 0)
    {
        foreach (var page in game.MemoryPages(true).Reverse())
        {
            var scanner = new SignatureScanner(game, page.BaseAddress, (int)page.RegionSize);
            if ((vars.gameOffset = scanner.Scan(pattern)) != IntPtr.Zero)
            {
                print("Found static Game members at 0x" + vars.gameOffset.ToString("X8"));
                scanAttempts = 0;
                break;
            }
        }
        if (scanAttempts == 0) break;
        print("Could not find pattern, retrying " + scanAttempts + " more times.");
        Thread.Sleep(1000);
    }

    if ((IntPtr)vars.gameOffset == IntPtr.Zero)
    print("Could not find pattern, Game version is likely unsupported.");

    vars.loading = new MemoryWatcher<byte>(vars.gameOffset + 0x8);
}

update{
    vars.loading.Update(game);
    print("Current loading: " + vars.loading.Current);
    print("Current mission: " + vars.gameOffset.ToString("X8"));
}

isLoading{
    if(vars.loading.Current == 1){
        return true;
    } else{
        return false;
    }
}*/

start{ 
    if(current.start != 0 && old.start == 0){
        return true;
    }
}

isLoading{
    if(current.LRT == 2 || current.LRT == 1){
        return true;
    } else{
        return false;
    }
}