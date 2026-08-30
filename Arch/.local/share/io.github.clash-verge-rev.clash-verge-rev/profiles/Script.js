// Define main function (script entry)

// 代理组通用配置
const groupBaseOption = {
  "interval": 300,
  "timeout": 3000,
  "url": "https://www.google.com/generate_204",
  "lazy": true,
  "max-failed-times": 3,
  "hidden": false
};

/**
 * 配置中的规则"config.rules"是一个数组，通过新旧数组合并来添加
 * @param prependRule 添加的数组
 */
const prependRule = [
  // My Custom
  "DOMAIN-SUFFIX,cedon.org,DIRECT",
  "DOMAIN-SUFFIX,cedon.cn,DIRECT",

  "DOMAIN-SUFFIX,chatgpt.com,ChatGPT",
  "DOMAIN-SUFFIX,openai.com,ChatGPT",
  'DOMAIN-SUFFIX,oaiusercontent.com,ChatGPT',

  "DOMAIN-SUFFIX,claude.ai,Claude",
  "DOMAIN-SUFFIX,claude.com,Claude",
  'DOMAIN-SUFFIX,anthropic.com,Claude',

  "PROCESS-PATH,/usr/bin/qbittorrent,DIRECT",
  // "DOMAIN-SUFFIX,steampowered.com,DIRECT",
  // "DOMAIN-SUFFIX,steam-chat.com,DIRECT",
  // "DOMAIN-KEYWORD,steamcdn,DIRECT",
  // "DOMAIN-KEYWORD,steamstore,DIRECT",
  // "DOMAIN-KEYWORD,steamuserimages,DIRECT",
  // "DOMAIN-KEYWORD,steambroadcast,DIRECT"

  // > Apple CDN
  "PROCESS-NAME,storedownloadd,DIRECT",
  // - USER-AGENT,com.apple.appstored*
  "DOMAIN,aod.itunes.apple.com,DIRECT",
  "DOMAIN,appldnld.apple.com,DIRECT",
  "DOMAIN,apptrailers.itunes.apple.com,DIRECT",
  "DOMAIN,gs-loc-cn.apple.com,DIRECT",
  "DOMAIN,iosapps.itunes.apple.com,DIRECT",
  "DOMAIN,music.apple.com,DIRECT",
  "DOMAIN,mvod.itunes.apple.com,DIRECT",
  "DOMAIN,osxapps.itunes.apple.com,DIRECT",
  "DOMAIN,supportdownload.apple.com,DIRECT",
  "DOMAIN,swcdn.apple.com,DIRECT",
  "DOMAIN,updates-http.cdn-apple.com,DIRECT",

  // > Epic
  "DOMAIN-KEYWORD,epicgames,DIRECT",

  // > Google
  "DOMAIN,safebrowsing.googleapis.com,DIRECT",
  "DOMAIN-SUFFIX,dl.google.com,DIRECT",

  // > Microsoft
  // - USER-AGENT,Microsoft%20Remote%20Desktop*
  "DOMAIN-SUFFIX,msftconnecttest.com,DIRECT",

  // > Passkey
  "DOMAIN-SUFFIX,auth.com,DIRECT",

  // > Proxy plugin
  "PROCESS-NAME,v2ray,DIRECT",
  "PROCESS-NAME,ss-local,DIRECT",

  // > PlayStation
  "DOMAIN-SUFFIX,dl.playstation.net,DIRECT",

  // > Steam
  // - USER-AGENT,Steam*
  "DOMAIN,cm.steampowered.com,DIRECT",
  "DOMAIN,ol.epicgames.com,DIRECT",
  "DOMAIN-SUFFIX,steamcontent.com,DIRECT",
  "DOMAIN-SUFFIX,steamserver.net,DIRECT",

  "DOMAIN-SUFFIX,steamchina.com,DIRECT",

  "DOMAIN,csgo.wmsj.cn,DIRECT",
  "DOMAIN,dota2.wmsj.cn,DIRECT",
  "DOMAIN,wmsjsteam.com,DIRECT",

  "DOMAIN,dl.steam.clngaa.com,DIRECT",
  "DOMAIN,dl.steam.ksyna.com,DIRECT",

  "DOMAIN,gstore.val.manlaxy.com,DIRECT",

  "DOMAIN,st.dl.bscstorage.net,DIRECT",
  "DOMAIN,st.dl.eccdnx.com,DIRECT",
  "DOMAIN,st.dl.pinyuncloud.com,DIRECT",

  "DOMAIN,steampipe.steamcontent.tnkjmec.com,DIRECT",

  "DOMAIN,steampowered.com.8686c.com,DIRECT",
  "DOMAIN,steamstatic.com.8686c.com,DIRECT",

  "DOMAIN,steambroadcast.akamaized.net,DIRECT",
  "DOMAIN,steamcdn-a.akamaihd.net,DIRECT",
  "DOMAIN,steamcommunity-a.akamaihd.net,DIRECT",
  "DOMAIN,steamstore-a.akamaihd.net,DIRECT",
  "DOMAIN,steamusercontent-a.akamaihd.net,DIRECT",
  "DOMAIN,steamuserimages-a.akamaihd.net,DIRECT",

  // > Tesla
  "DOMAIN,tesla-cdn.thron.cn,DIRECT",
  "DOMAIN,tesla-cdn.thron.com,DIRECT",
  "DOMAIN-SUFFIX,solarcity.com,DIRECT",
  "DOMAIN-SUFFIX,tesla.cn,DIRECT",
  "DOMAIN-SUFFIX,tesla.com,DIRECT",
  "DOMAIN-SUFFIX,tesla.com.cn,DIRECT",
  "DOMAIN-SUFFIX,teslamotors.cn,DIRECT",
  "DOMAIN-SUFFIX,teslamotors.com,DIRECT",
  "DOMAIN-SUFFIX,teslamotors.com.cn,DIRECT",
  "DOMAIN-SUFFIX,ts.la,DIRECT",

  // > UUBooster
  "PROCESS-NAME,UUBooster,DIRECT",

  // > WiFiman
  "DOMAIN-SUFFIX,app-measurement.com,DIRECT",

  // > Xunlei
  // - USER-AGENT,%E8%BF%85%E9%9B%B7
  "DOMAIN-SUFFIX,xunlei.com,DIRECT",

  // > Download
  "PROCESS-NAME,aria2c.exe,DIRECT",
  "PROCESS-NAME,BitComet.exe,DIRECT",
  "PROCESS-NAME,fdm.exe,DIRECT",
  // - PROCESS-NAME,IDMan.exe
  "PROCESS-NAME,NetTransport.exe,DIRECT",
  "PROCESS-NAME,qbittorrent.exe,DIRECT",
  "PROCESS-NAME,Thunder.exe,DIRECT",
  "PROCESS-NAME,transmission-daemon.exe,DIRECT",
  "PROCESS-NAME,transmission-qt.exe,DIRECT",
  "PROCESS-NAME,uTorrent.exe,DIRECT",
  "PROCESS-NAME,WebTorrent.exe,DIRECT",
  "PROCESS-NAME,aria2c,DIRECT",
  "PROCESS-NAME,fdm,DIRECT",
  "PROCESS-NAME,Folx,DIRECT",
  "PROCESS-NAME,NetTransport,DIRECT",
  "PROCESS-NAME,qbittorrent,DIRECT",
  "PROCESS-NAME,qbittorrent-nox,DIRECT",
  "PROCESS-NAME,Thunder,DIRECT",
  "PROCESS-NAME,Transmission,DIRECT",
  "PROCESS-NAME,uTorrent,DIRECT",
  "PROCESS-NAME,WebTorrent,DIRECT",
  "PROCESS-NAME,WebTorrent Helper,DIRECT",

  // > Private Tracker
  "DOMAIN-SUFFIX,audiences.me,DIRECT",
  "DOMAIN-SUFFIX,awesome-hd.me,DIRECT",
  "DOMAIN-SUFFIX,broadcasthe.net,DIRECT",
  "DOMAIN-SUFFIX,chdbits.co,DIRECT",
  "DOMAIN-SUFFIX,classix-unlimited.co.uk,DIRECT",
  "DOMAIN-SUFFIX,dmhy.best,DIRECT",
  "DOMAIN-SUFFIX,empornium.me,DIRECT",
  "DOMAIN-SUFFIX,gazellegames.net,DIRECT",
  "DOMAIN-SUFFIX,hdchina.org,DIRECT",
  "DOMAIN-SUFFIX,hdsky.me,DIRECT",
  "DOMAIN-SUFFIX,icetorrent.org,DIRECT",
  "DOMAIN-SUFFIX,jpopsuki.eu,DIRECT",
  "DOMAIN-SUFFIX,keepfrds.com,DIRECT",
  "DOMAIN-SUFFIX,madsrevolution.net,DIRECT",
  "DOMAIN-SUFFIX,m-team.cc,DIRECT",
  "DOMAIN-SUFFIX,nanyangpt.com,DIRECT",
  "DOMAIN-SUFFIX,ncore.cc,DIRECT",
  "DOMAIN-SUFFIX,open.cd,DIRECT",
  "DOMAIN-SUFFIX,ourbits.club,DIRECT",
  "DOMAIN-SUFFIX,passthepopcorn.me,DIRECT",
  "DOMAIN-SUFFIX,privatehd.to,DIRECT",
  "DOMAIN-SUFFIX,redacted.ch,DIRECT",
  "DOMAIN-SUFFIX,sandai.net,DIRECT",
  "DOMAIN-SUFFIX,springsunday.net,DIRECT",
  "DOMAIN-SUFFIX,tjupt.org,DIRECT",
  "DOMAIN-SUFFIX,totheglory.im,DIRECT",
  "DOMAIN-SUFFIX,audiences.me,DIRECT",

  "DOMAIN-KEYWORD,announce,DIRECT",
  "DOMAIN-KEYWORD,torrent,DIRECT",
  "DOMAIN-SUFFIX,smtp,DIRECT",
  // - URL-REGEX,(Subject|HELO|SMTP)

  // > UBI
  "DOMAIN,uplaypc-s-ubisoft.cdn.ubi.com,DIRECT",
];

const appendProxyGroups = [
  {
    ...groupBaseOption,
    "name": "ChatGPT",
    "type": "select",
    "proxies": ['🇯🇵|日本-中转 01', '🇯🇵|日本-中转 02', '🇯🇵|日本-IEPL 01', '🇯🇵|日本-IEPL 02', '🇯🇵|日本原生-IEPL 01', '🇯🇵|日本原生-IEPL 02', '🇯🇵|日本原生-中转 01', '🇯🇵|日本原生-中转 02', '🇯🇵|日本原生-直连', '🇺🇸|美国-IEPL 01', '🇺🇸|美国-IEPL 02', '🇺🇸|美国-直连', '🇺🇸|美国-中转 01', '🇺🇸|美国-中转 02'],
    "icon": "https://fastly.jsdelivr.net/gh/clash-verge-rev/clash-verge-rev.github.io@main/docs/assets/icons/chatgpt.svg"
  },
  {
    ...groupBaseOption,
    "name": "Claude",
    "type": "select",
    "proxies": ['🇯🇵|日本-中转 01', '🇯🇵|日本-中转 02', '🇯🇵|日本-IEPL 01', '🇯🇵|日本-IEPL 02', '🇯🇵|日本原生-IEPL 01', '🇯🇵|日本原生-IEPL 02', '🇯🇵|日本原生-中转 01', '🇯🇵|日本原生-中转 02', '🇯🇵|日本原生-直连', '🇺🇸|美国-IEPL 01', '🇺🇸|美国-IEPL 02', '🇺🇸|美国-直连', '🇺🇸|美国-中转 01', '🇺🇸|美国-中转 02'],
    "icon": "https://fastly.jsdelivr.net/gh/clash-verge-rev/clash-verge-rev.github.io@main/docs/assets/icons/claude.svg"
  },
];

function main(config, profileName) {
  if (profileName == "SakuraCat") {
    // 把旧规则合并到新规则后面(也可以用其它合并数组的办法)
    let oldrules = config["rules"];
    // let oldProxyGroups = config["proxy-groups"];

    config["rules"] = prependRule.concat(oldrules);
    // config["proxy-groups"] = appendProxyGroups.concat(oldProxyGroups);
    config["proxy-groups"].push(...appendProxyGroups);
  }
  return config;
}
