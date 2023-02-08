function gShowPageLoader( callback ) {
	$('#gPageLoader').removeClass('d-none');
	if( callback ){
		setTimeout( callback, 100 );
	}
}
function gShowPageLoader1( callback, args1 ) {
	$('#gPageLoader').removeClass('d-none');
	setTimeout( callback, 100, args1 );
}
function gShowPageLoader2( callback, args1, args2 ) {
	$('#gPageLoader').removeClass('d-none');
	setTimeout( callback, 100, args1, args2 );
}
function gShowPageLoader3( callback, args1, args2, args3 ) {
	$('#gPageLoader').removeClass('d-none');
	setTimeout( callback, 100, args1, args2, args3 );
}
function gShowPageLoader4( callback, args1, args2, args3, args4 ) {
	$('#gPageLoader').removeClass('d-none');
	setTimeout( callback, 100, args1, args2, args3, args4 );
}
function gShowPageLoader5( callback, args1, args2, args3, args4, args5 ) {
	$('#gPageLoader').removeClass('d-none');
	setTimeout( callback, 100, args1, args2, args3, args4, args5 );
}
function gHidePageLoader(){ $('#gPageLoader').addClass('d-none'); }

function gAlert( title, htmlMsg, callback ) {
    $( '#gAlertModal .modal-title' ).text( title );
    $( '#gAlertModal .modal-body' ).html( htmlMsg );
    $( '#gAlertModal' ).off( "hide.bs.modal" );
    if( callback ) {
        $( '#gAlertModal' ).one( "hide.bs.modal", callback );
    }
    $( '#gAlertModal' ).modal( 'show' );
}

function gConfirm( title, htmlMsg, callback ) {
    $( '#gConfirmModal .modal-title' ).text( title );
    $( '#gConfirmModal .modal-body' ).html( htmlMsg );
    $( '#gConfirmModal .btn-confirm' ).off( 'click' ).one( 'click', function() {
        callback();
        $( '#gConfirmModal' ).modal( 'hide' );
    } );
    $( '#gConfirmModal' ).modal( 'show' );
}

const SUCCESS = 200, ERROR = 500, REDIRECT = 300;
function gAjax( options, callback, fCallback ) {
    gShowPageLoader();
    if( options.enctype == "multipart/form-data" ) {
        options.data.append( 'REQUEST_URL', options.url );
    } else {
        options.data["REQUEST_URL"] = options.url;
    }
    
    options.url = "/AjaxController/";
    
    $.ajax( options )
     .done( function( ajaxResponse ) {
        if( ajaxResponse &&
            ajaxResponse.ajaxResponseCode &&
            parseInt( ajaxResponse.ajaxResponseCode ) == SUCCESS ) {
	
            callback( ajaxResponse );

        } else if( ajaxResponse &&
            ajaxResponse.ajaxResponseCode &&
            parseInt( ajaxResponse.ajaxResponseCode ) == REDIRECT ) {
	
            window.location.href = ajaxResponse.ajaxResponseUrl;

        } else if( ajaxResponse && ajaxResponse.ajaxResponseText ) {
	
			if( fCallback ) {
	            fCallback( ajaxResponse );
			} else {
				gAlert( "Request Failed", ajaxResponse.ajaxResponseText );
	            gHidePageLoader();
			}
			
        } else {
	
			if( fCallback ) {
				fCallback();
			} else {
	            gAlert( "Request Failed", "Unable to process your request." );
	            gHidePageLoader();
			}
        }
    } )
    .fail( function( jqXHR ) {
		if( fCallback ) {
			fCallback();
		} else {
	        gAlert( "Request Failed", "HD: " + jqXHR.statusText );
	        gHidePageLoader();
		}
    } );
}

function changePassword() {
    var pwd = $( "#changePasswordInput" ).val();
    if( !pwd || pwd.length == 0 ) {
        gAlert( "Password", "Please enter new password." );
        return;
    }
    
    var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
	if( !(re.test( pwd )) ) {
		gAlert( "Password should be at least 8 character long. Required minimum 1 special char, 1 Captical Letter, 1 small letter and 1 number.");
		return;
	}
    
    gAjax({
		context : this,
		method  : "POST",
		url     : "/ChangePassword/",
        data    : {
            pwd: pwd
        }
	}, function( ar ) {
        $( "#changePasswordSpan" ).text( null );
        $( "#changePasswordInput" ).val( null );
        $( "#changePasswordModal" ).modal( "hide" );
		gAlert( "Password", "Password changed successfully." );
		gHidePageLoader();
	});
}

$( function () {
	var isOnIOS = navigator.userAgent.match(/iPad/i)|| navigator.userAgent.match(/iPhone/i);
	var eventName = isOnIOS ? "pagehide" : "beforeunload";
	window.addEventListener( eventName, gShowPageLoader );
    
    $( ".modal .close span" ).text( "x" );
    
    $( '.card-header' ).on( 'click', function() {
        var $icon = $( '.panel-expand-collapse', this );
        if( $icon.hasClass( 'fa-chevron-up' ) ) {
            $( this ).siblings( '.card-body' ).hide( 500 );
            $icon.removeClass( 'fa-chevron-up' )
                 .addClass( 'fa-chevron-down' );
        } else {
            $( this ).siblings( '.card-body' ).show( 500 );
            $icon.removeClass( 'fa-chevron-down' )
                 .addClass( 'fa-chevron-up' );
        }
    } );
    
    if( loginUser.pwdExpired ) {
        $( "#changePasswordSpan" ).text( "Your password is expired and needs to be changed." );
        $( ".btn-modal-close" ).addClass( "d-none" );
        $( "#changePasswordModal" ).modal( "show" );
    } else if( loginUser.pwdReset ) {
        $( "#changePasswordSpan" ).text( "Your password is reset by administrator and needs to be changed." );
        $( ".btn-modal-close" ).addClass( "d-none" );
        $( "#changePasswordModal" ).modal( "show" );
    } else {
        $( ".btn-modal-close" ).removeClass( "d-none" );
    }
    
    $( "#changePasswordSave" ).on( "click", changePassword );
    
    gOnPageLoad();
} );