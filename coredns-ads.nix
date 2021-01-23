{ ... }:

{
  services.coredns-ads = {
    enable = true;
    config = ''
      .:53 {
          loop
          ads {
            # Not sure where these are/were from
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/adaway.org/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/adblock-nocoin-list/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/adguard-simplified/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/anudeepnd-adservers/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/disconnect.me-ad/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/disconnect.me-malvertising/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/disconnect.me-malware/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/disconnect.me-tracking/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/easyprivacy/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/eth-phishing-detect/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/fademind-add.2o7net/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/fademind-add.dead/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/fademind-add.risk/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/fademind-add.spam/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/kadhosts/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/malwaredomainlist.com/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/malwaredomains.com-immortaldomains/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/malwaredomains.com-justdomains/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/matomo.org-spammers/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/mitchellkrogza-badd-boyz-hosts/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/pgl.yoyo.org/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/ransomwaretracker.abuse.ch/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/someonewhocares.org/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/spam404.com/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/stevenblack/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/winhelp2002.mvps.org/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/zerodot1-coinblockerlists-browser/list.txt
            blacklist https://raw.githubusercontent.com/hectorm/hmirror/master/data/zeustracker.abuse.ch/list.txt
            blacklist https://raw.githubusercontent.com/CHEF-KOCH/Audio-fingerprint-pages/master/AudioFp.txt
            blacklist https://raw.githubusercontent.com/CHEF-KOCH/Canvas-fingerprinting-pages/master/Canvas.txt
            blacklist https://raw.githubusercontent.com/CHEF-KOCH/WebRTC-tracking/master/WebRTC.txt
            blacklist https://raw.githubusercontent.com/CHEF-KOCH/CKs-FilterList/master/Anti-Corp/hosts/NSABlocklist.txt
            blacklist https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt
            blacklist https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-malware.txt
            blacklist https://www.stopforumspam.com/downloads/toxic_domains_whole.txt
            # From pihole
            blacklist https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
            blacklist https://mirror1.malwaredomains.com/files/justdomains
            blacklist https://sysctl.org/cameleon/hosts
            blacklist https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt
            blacklist https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
            blacklist https://hosts-file.net/ad_servers.txt
            list-store /var/lib/coredns-ads/lists
            default-lists
            log
          }

          auto neatfu.com {
            directory /var/lib/coredns-ads/zones.d
          }

          loadbalance round_robin
          forward . 1.1.1.1 8.8.8.8 1.0.0.1 8.8.4.4 2606:4700:4700::1111 2001:4860:4860::8888 2606:4700:4700::1001 2001:4860:4860::8844
          log
          errors
          prometheus :9100
          cache
      }
    '';
  };
}
