{ config, ...}:
{
    accounts.email.accounts = {
        outlook = {
            address = "theo.gardet@epita.fr";
            userName = "theo.gardet@epita.fr";
            realName = "Théo Gardet";
            # mbsync =  {
            #     enable = true;
            # };

            primary = true;
            signature = {
                delimiter = "-- ";
                text = ''
                    Théo Gardet
                    ING1 2025 - LRE - ACDC
                '';
            };

            flavor = "outlook.office365.com";
        };

        # sfr = {
        #
        # imap = {
        #     host = "outlook.office365.com";
        #     port = 993;
        #     tls = {
        #         enable = true;
        #     };
        #
        # };
        #
        # stmp = {
        #     host = "smtp.office365.com";
        #     port = 587;
        #
        #     tls = {
        #         enable = true;
        #         useStartTls = true;
        #     }
        #
        # };
        # };
        #
        # gmail_prologin = {
        #
        #     flavor = "gmail.com";
        # };
        #
        # gmail_atelier = {
        #
        #     flavor = "gmail.com";
        # };
        #
        # gmail_perso = {
        #
        #     flavor = "gmail.com";
        # };
        #
        # laposte = {
        #
        # };
    };
}
