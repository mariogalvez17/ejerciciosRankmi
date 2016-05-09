
 (function(window) {
  
  /**
    * JavaScript Client Detection
    * (C) viazenetti GmbH (Christian Ludwig)
    *
  **/

  var a, browser, clientStrings,  cs, d, e, id, ix, majorVersion,  nAgt, nVer, nameOffset, os, osVersion, unknown, verOffset, version;
  unknown = '-';
  nVer = navigator.appVersion;
  nAgt = navigator.userAgent;
  browser = navigator.appName;
  version = '' + parseFloat(navigator.appVersion);
  majorVersion = parseInt(navigator.appVersion, 10);
  nameOffset = void 0;
  verOffset = void 0;
  ix = void 0;
  if ((verOffset = nAgt.indexOf('Opera')) !== -1) {
    browser = 'Opera';
    version = nAgt.substring(verOffset + 6);
    if ((verOffset = nAgt.indexOf('Version')) !== -1) {
      version = nAgt.substring(verOffset + 8);
    }
  } else if ((verOffset = nAgt.indexOf('MSIE')) !== -1) {
    browser = 'Microsoft Internet Explorer';
    version = nAgt.substring(verOffset + 5);
  } else if ((verOffset = nAgt.indexOf('Chrome')) !== -1) {
    browser = 'Chrome';
    version = nAgt.substring(verOffset + 7);
  } else if ((verOffset = nAgt.indexOf('Safari')) !== -1) {
    browser = 'Safari';
    version = nAgt.substring(verOffset + 7);
    if ((verOffset = nAgt.indexOf('Version')) !== -1) {
      version = nAgt.substring(verOffset + 8);
    }
  } else if ((verOffset = nAgt.indexOf('Firefox')) !== -1) {
    browser = 'Firefox';
    version = nAgt.substring(verOffset + 8);
  } else if (nAgt.indexOf('Trident/') !== -1) {
    browser = 'Microsoft Internet Explorer';
    version = nAgt.substring(nAgt.indexOf('rv:') + 3);
  } else if ((nameOffset = nAgt.lastIndexOf(' ') + 1) < (verOffset = nAgt.lastIndexOf('/'))) {
    browser = nAgt.substring(nameOffset, verOffset);
    version = nAgt.substring(verOffset + 1);
    if (browser.toLowerCase() === browser.toUpperCase()) {
      browser = navigator.appName;
    }
  }
  if ((ix = version.indexOf(';')) !== -1) {
    version = version.substring(0, ix);
  }
  if ((ix = version.indexOf(' ')) !== -1) {
    version = version.substring(0, ix);
  }
  if ((ix = version.indexOf(')')) !== -1) {
    version = version.substring(0, ix);
  }
  majorVersion = parseInt('' + version, 10);
  if (isNaN(majorVersion)) {
    version = '' + parseFloat(navigator.appVersion);
    majorVersion = parseInt(navigator.appVersion, 10);
  }
  os = unknown;
  clientStrings = [
  {
    s: 'Windows 10',
    r: /(Windows 10.0|Windows NT 10.0)/
  }, {
    s: 'Windows 8.1',
    r: /(Windows 8.1|Windows NT 6.3)/
  }, {
    s: 'Windows 8',
    r: /(Windows 8|Windows NT 6.2)/
  }, {
    s: 'Windows 7',
    r: /(Windows 7|Windows NT 6.1)/
  }, {
    s: 'Windows Vista',
    r: /Windows NT 6.0/
  }, {
    s: 'Windows Server 2003',
    r: /Windows NT 5.2/
  }, {
    s: 'Windows XP',
    r: /(Windows NT 5.1|Windows XP)/
  }, {
    s: 'Windows 2000',
    r: /(Windows NT 5.0|Windows 2000)/
  }, {
    s: 'Windows ME',
    r: /(Win 9x 4.90|Windows ME)/
  }, {
    s: 'Windows 98',
    r: /(Windows 98|Win98)/
  }, {
    s: 'Windows 95',
    r: /(Windows 95|Win95|Windows_95)/
  }, {
    s: 'Windows NT 4.0',
    r: /(Windows NT 4.0|WinNT4.0|WinNT|Windows NT)/
  }, {
    s: 'Windows CE',
    r: /Windows CE/
  }, {
    s: 'Windows 3.11',
    r: /Win16/
  }, {
    s: 'Android',
    r: /Android/
  }, {
    s: 'Open BSD',
    r: /OpenBSD/
  }, {
    s: 'Sun OS',
    r: /SunOS/
  }, {
    s: 'Linux',
    r: /(Linux|X11)/
  }, {
    s: 'iOS',
    r: /(iPhone|iPad|iPod)/
  }, {
    s: 'Mac OS X',
    r: /Mac OS X/
  }, {
    s: 'Mac OS',
    r: /(MacPPC|MacIntel|Mac_PowerPC|Macintosh)/
  }, {
    s: 'QNX',
    r: /QNX/
  }, {
    s: 'UNIX',
    r: /UNIX/
  }, {
    s: 'BeOS',
    r: /BeOS/
  }, {
    s: 'OS/2',
    r: /OS\/2/
  }, {
    s: 'Search Bot',
    r: /(nuhk|Googlebot|Yammybot|Openbot|Slurp|MSNBot|Ask Jeeves\/Teoma|ia_archiver)/
  }
  ];
  for (id in clientStrings) {
    cs = clientStrings[id];
    if (cs.r.test(nAgt)) {
      os = cs.s;
      break;
    }
  }
  osVersion = unknown;
  if (/Windows/.test(os)) {
    osVersion = /Windows (.*)/.exec(os)[1];
    os = 'Windows';
  }
  switch (os) {
    case 'Mac OS X':
    osVersion = /Mac OS X (10[\.\_\d]+)/.exec(nAgt)[1];
    break;
    case 'Android':
    osVersion = /Android ([\.\_\d]+)/.exec(nAgt)[1];
    break;
    case 'iOS':
    osVersion = /OS (\d+)_(\d+)_?(\d+)?/.exec(nVer);
    osVersion = osVersion[1] + '.' + osVersion[2] + '.' + (osVersion[3] | 0);
  }
  
  window.jscd = {
    browser: browser,
    browserVersion: version,
    os: os,
    osVersion: osVersion,
  };
})(this);


function Tracker(TOKEN_VALIDACION) { 

  var xhttp= new XMLHttpRequest();

  xhttp.open("GET", 'https://mathiasbynens.be/demo/ip', false);
  
  xhttp.onreadystatechange=function(){  

    if(xhttp.readyState == 4 && xhttp.status == 200)
    { 

      clienteIP= JSON.parse(xhttp.responseText)['ip'];

      $.ajax({

        headers: {

          'X-Auth-Token' : TOKEN_VALIDACION,

        },

        type: 'get',

        url: 'http://localhost:3001/api/v1/applications/identity/',

      }).fail(function(data){

        console.log('Error: ' + JSON.stringify(data['responseJSON']));

        return;

      }).success(function(data){

        this.token = TOKEN_VALIDACION;

        this.clientSO = jscd.os + ' ' + jscd.osVersion ;

        this.clientBrowser = jscd.browser + ' ' + jscd.browserVersion

        this.clientIP = clienteIP

        var Cliente = {clientIP: this.clientIP, clientBrowser: this.clientBrowser, clientSO: this.clientSO};

        $.ajax({
          
          headers: {
            
            'X-Auth-Token' : this.token
          },
          
          type: 'post',
          
          url: 'http://localhost:3001/api/v1/clientes/',
          
          data: JSON.stringify(Cliente),
          
          contentType: 'application/json'
        }).fail(function(data){
          
          console.log('Error: ' + JSON.stringify(data['responseJSON']));
          
          return;
        
        }).success(function(data) {
          
          console.log('Cliente Registrado');
          
          return;
        }); 

        //alert(this.clientSO+ ' ' + this.clientBrowser + ' ' + clienteIP );
      });        

    }
  }
  xhttp.send(null);
}


Tracker.prototype.track = function(Action,Options) {
  
  var fecha = new Date();    
  
  var  Evento = {nombre:Action, options:Options, padre:this.clientIP,hora:fecha};
  
  console.log(Evento);
  $.ajax({
    
    headers: {
    
      'X-Auth-Token' : this.token
    },
    
    type: 'post',
    
    url: 'http://localhost:3001/api/v1/eventos',
    
    data :JSON.stringify(Evento),
    
    contentType: 'application/json'
  
  }).done(function(data) {
     
      console.log('llegaron:' + Options.marca);
      return
  });

};

  // este evento se ejecuta cuando un usuario presiona el botón comprar.

  $(function () {   
    var app = new Tracker('z9xid0yon');
    $("#nuevo").click(function(){
      app.track($(this).attr("id"),options=
        {marca:$(this).data("marca"),
        modelo:$(this).data("modelo"),
        anio:$(this).data("anio")});
    });
  });

// ---
