

//======================== ==================================
 //commit by surya

$(function () {
    $('#indentGenerate, #supplyOrderGenerate, #supplyOrderGenerateMd, #supplyCementOrderGenerate').click(function () {
        var btnID = $(this).attr('id');
        var windowName = "GeneratePage";
        var wOption = "width=1280,height=600,menubar=yes,scrollbars=yes,location=no,left=100,top=100";
        var cloneTable = $("#viewTable").clone();
        cloneTable.find('input[type=text],select,textarea').each(function () {
            var elementType = $(this).prop('tagName');
            if (elementType == 'SELECT')
                var textVal = $(this).find("option:selected").text();
            else
                var textVal = $(this).val();
            $(this).replaceWith('<label>' + textVal + '</label>');
        });
        cloneTable.find('a').each(function () {
            var anchorVal = $(this).text();
            $(this).replaceWith('<label>' + anchorVal + '</label>');
        });
        var wWinPrint = window.open("", windowName, wOption);
        wWinPrint.document.open();
        wWinPrint.document.write("<html><head><link href='../css/Print.css' rel='stylesheet' /><link href='../css/font-awesome.min.css' rel='stylesheet' /><title></title></head><body>");
        wWinPrint.document.write('<div style="padding:5px; margin-bottom:10px; border-bottom:#aeaeae solid 3px;"><img src=../img/HP_Govt.png height=55 style="float: left;margin-right: 10px;" /><div style="float: left;padding-top: 10px;"><h1>Himachal Pradesh State Civil Supplies Corporation Ltd</h1></div><div style="clear: both;"></div></div>');
        if (btnID == "indentGenerate") {
            wWinPrint.document.write("<br /><br /><div class='header'>M/s BHUBAN POWER & STEEL LTD.,<br />Factory Address : CHANDIGARH AMBALA ROAD, DERABASSI, DISTT. MOHALI-140507<br />Regd. Office: 3 INDUSTRIAL AREA, PHASE-1, CHANDIGARH-160002</div>")
            wWinPrint.document.write("<hr /><div class='hd_title text-center'>DETAIL SHOWING RATES, DIVISION-WISE/DIA-WISE QUANTITIES & AMOUNTS F.O.R. DESTINATION FOR EXCISE DUTY NON-EXEMPT GI PIPES (September, 2014)</div><br />");
        } else if (btnID == "supplyOrderGenerate") {
            wWinPrint.document.write("<br /><br /><div class='header'>M/s APL APOLLO TUBES LTD,<br />REGD. OFFICE 37 HARGOVIND ENCLAVE, VIKAS MARG, DELHI-110092</div>")
            wWinPrint.document.write("<hr /><div class='hd_title text-center'>DETAIL SHOWING THE DIVISION-WISE/DIA-WISE QUANTITY, RATES & AMOUNTS AT NEAREST RAIL HEAD FOR EXCISE DUTY EXEMPTED GI PIPES (September, 2014)</div><br />");
        } else if (btnID == "supplyOrderGenerateMd") {
            wWinPrint.document.write("<br /><br /><div class='header'>M/s APL APOLLO TUBES LTD,<br />REGD. OFFICE 37 HARGOVIND ENCLAVE, VIKAS MARG, DELHI-110092</div>")
            wWinPrint.document.write("<hr /><div class='hd_title text-center'>DETAIL SHOWING THE  QUANTITY, RATES & AMOUNTS AT NEAREST RAIL HEAD FOR EXCISE DUTY EXEMPTED MEDICINE (September, 2014)</div><br />");
        } else if (btnID == "supplyCementOrderGenerate") {
            wWinPrint.document.write("<br /><br /><div class='header'>Ambuja Cement LTD,Khalini, Shimla-3</div>")
        }

        wWinPrint.document.write("<div id='printContent'>" + cloneTable.html() + "</div>");
        //wWinPrint.document.write("<div id='printFooter'>"+printFooter+"</div>");
        wWinPrint.document.write("</body></html>");
        wWinPrint.document.close();
        wWinPrint.focus();
        return wWinPrint;
    });
    $('.PrintMedicineSupplyOrder').click(function () {
        var windowName = "GeneratePage";
        var wOption = "width=1024,height=600,menubar=yes,scrollbars=yes,location=no,left=100,top=100";
        var wWinPrint = window.open("printSupplyOrder.aspx", windowName, wOption);
    });
    activeRadio();
    $(document).on('click', 'input[type="radio"]', function () {
        activeRadio();
    });

    try {
        $('.date-picker').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd-M-yy'
        });
    }
    catch (e) { }

    $(document).on("click", ".dateAddon", function () {
        $(this).prev('.date-picker').focus();
    });
});

function activeRadio() {
    $('input[type="radio"]').each(function () {
        if ($(this).is(':checked')) {
            $(this).closest('label').addClass('actvRadio');
        } else {
            $(this).closest('label').removeClass('actvRadio');
        }
    });
}
function openHTMLStrModal(header, body, footer) {
    $('#pageModal .modal-header #myModalLabel').html(header);
    $('#pageModal .modal-body').html(body);
    $('#pageModal .modal-footer').html(footer);
    if (footer == "") { $('#pageModal .modal-footer').remove(); }
    $('#pageModal').modal();
}
function openPageModal(header, page, footer, frm_hit) {
    $('#pageModal .modal-header #myModalLabel').html(header);
    $('#pageModal .modal-body').html("<iframe width='100%' height='" + frm_hit + "px' src='" + page + "' frameborder='0' scrolling='yes'></iframe>");
    $('#pageModal .modal-footer').html(footer);
    if (footer == "") { $('#pageModal .modal-footer').remove(); }
    $('#pageModal').modal();
}
function openPageModal_MD(header, page, footer, frm_hit) {
    $('#pageModal-md .modal-header #myModalLabel').html(header);
    $('#pageModal-md .modal-body').html("<iframe width='100%' height='" + frm_hit + "px' src='" + page + "' frameborder='0'></iframe>");
    $('#pageModal-md .modal-footer').html(footer);
    if (footer == "") { $('#pageModal-md .modal-footer').remove(); }
    $('#pageModal-md').modal();
}


//Added by Tapan Kumar Mishra For Refresh parent page after close modal page
function hidePageModal(opt) {
    $('#pageModal').modal('hide');
    $('#pageModal .modal-header #myModalLabel').html("");
    $('#pageModal .modal-body').html("");
    $('#pageModal .modal-footer').html("");
    if (opt.reload == true) {
        location.reload();
    }
}

//======================== ==================================

var month = new Array();
month[0] = "Jan";
month[1] = "Feb";
month[2] = "Mar";
month[3] = "Apr";
month[4] = "May";
month[5] = "Jun";
month[6] = "Jul";
month[7] = "Aug";
month[8] = "Sep";
month[9] = "Oct";
month[10] = "Nov";
month[11] = "Dec";

function IsSpecialCharacter1stPalce(cntr) {
    var strValue = $('#' + cntr).val();
    // alert(strValue);
    if (strValue != "") {
        var FistChar = strValue.charAt(0);
        if (/^[a-zA-Z0-9]*$/.test(FistChar) == false) {
            BootstrapAlert('Special characters Or White space are not allowed at first place !!!', cntr);
            return false;
        } else { return true; }
        return true;
    }
    else
        return false;
}
function IsWhiteSpace1stPalce(cntr) {
    var strValue = $('#' + cntr).val();
    // alert(strValue);
    if (strValue != "") {
        var FistChar = strValue.charAt(0);
        if (FistChar == " ") {
            BootstrapAlert('White space are not allowed at 1st place !!!', cntr);
            return false;
        } else { return true; }
        return true;
    }
    else
        return true;
}

function DecimalNumber(cntr, strText) {
    var regexPattern = /^\d{0,18}(\.\d{1,3})?$/;
    var entered_value = $('#' + cntr).val();
    if (!regexPattern.test(entered_value)) {
        BootstrapAlert('Enter a valid ' + strText, cntr);
        return false;
    }
    else
        return true;
}

function MobileNumber(cntr) {
    var Mobile = /^[7-9][0-9]{9}$/
    var entered_no = $('#' + cntr).val();
    if (!Mobile.test(entered_no)) {
        BootstrapAlert('Enter a valid Mobile Number', cntr);
        return false;
    }
    else
        return true;
}

function CompareDateRange(Controlname1, Controlname2, Fieldname1, Fieldname2) {
    var fromDate = $("input#" + Controlname1).val();
    var toDate = $("input#" + Controlname2).val();
    //alert(fromDate+'==='+toDate);
    if (toDate != "") {
        var dateParts = fromDate.split("-");
        var newDateStr = dateParts[1] + " " + dateParts[0] + ", " + dateParts[2];
        var fdate = new Date(newDateStr);
        // alert(fdate);
        var dateParts1 = toDate.split("-");
        var newDateStr1 = dateParts1[1] + " " + dateParts1[0] + ", " + dateParts1[2];
        var tdate = new Date(newDateStr1);
        // alert(tdate);
        if (fdate > tdate) {
            BootstrapAlert("Invalid Date Range!\n" + Fieldname2 + " can not be before " + Fieldname1, Controlname2);
            return false;
        }
        return true;
    }
}

function CompareTwoDate(Controlname1, Controlname2, Fieldname1, Fieldname2) {
    var fromDate = $("input#" + Controlname1).val();
    var toDate = $("input#" + Controlname2).val();
    //alert(fromDate+'==='+toDate);
    if (toDate != "") {
        var dateParts = fromDate.split("-");
        var newDateStr = dateParts[1] + " " + dateParts[0] + ", " + dateParts[2];
        var fdate = new Date(newDateStr);
        // alert(fdate);
        var dateParts1 = toDate.split("-");
        var newDateStr1 = dateParts1[1] + " " + dateParts1[0] + ", " + dateParts1[2];
        var tdate = new Date(newDateStr1);
        // alert(tdate);
        if (fdate > tdate) {
            BootstrapAlert(Fieldname2 + " can not be before " + Fieldname1, Controlname2);
            return false;
        }
        return true;
    }
}

function ValidateEmail(cntr) {
    var email = $('#' + cntr).val();
    //alert(email);
    if (email != "") {
        var reg = /^[A-Za-z0-9]([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
        if (!reg.test(email)) {
            BootstrapAlert('Enter a valid email id', cntr);
            return false;
        }
        else
            return true;
    }
    else
        return true;
};


function ValidateDropdown(cntr, strText) {
    var strValue = $('#' + cntr).val();
    if (strValue.length == 0 || strValue == "0") {
        BootstrapAlert("Please Select " + strText, cntr);
        return false;
    }
    else
        return true;
}

function BlankTextBox(cntr, strText) {
    var strValue = $('#' + cntr).val();
    if (strValue == "") {
        BootstrapAlert(strText + " can not be left blank", cntr);
        return false;
    }
    else
        return true;
}

function ValidateFile(cntr, strText) {
    //debugger;
    var strValue = $('#' + cntr).get(0).files.length;
    if (strValue == "0") {
        BootstrapAlert("Please upload " + strText + " copy", cntr);
        return false;
    }
    else
        return true;
}

function CheckFileType(cntr, ftype) {

    // Get the file upload control file extension
    var extn = $('#' + cntr).val().split('.').pop().toLowerCase();
    if (extn != '') {
        //debugger;        
        // Create array with the files extensions to upload
        var fileListToUpload;
        if (parseInt(ftype) == 1)
            fileListToUpload = new Array('pdf', 'gif', 'jpg', 'jpeg');
        else if (parseInt(ftype) == 2)
            fileListToUpload = new Array('gif', 'jpg', 'jpeg');
        else
            fileListToUpload = new Array('pdf');

        //Check the file extension is in the array.               
        var isValidFile = $.inArray(extn, fileListToUpload);

        // isValidFile gets the value -1 if the file extension is not in the list.  
        if (isValidFile == -1) {
            if (parseInt(ftype) == 1)
                BootstrapAlert('Please select a valid file of type pdf/gif/jpeg.', cntr);
            else if (parseInt(ftype) == 2)
                BootstrapAlert('Please select a valid file of type gif/jpeg.', cntr);
            else
                BootstrapAlert('Please select a valid pdf file only', cntr);
            $('#' + cntr).replaceWith($('#' + cntr).val('').clone(true));
        }
        else {
            // Restrict the file size to 500 KB.
            if ($('#' + cntr).get(0).files[0].size > (1024 * 500)) {
                BootstrapAlert('File size should not exceed 500 KB.', cntr);
                $('#' + cntr).replaceWith($('#' + cntr).val('').clone(true));
            }
            if ($('#' + cntr).get(0).files[0].name.length > 50) {
                BootstrapAlert('File Name should be maximum 50 Characters', cntr);
                $('#' + cntr).replaceWith($('#' + cntr).val('').clone(true));
            }
            else
                return true;
        }
    }
    else
        return true;
}

function CheckZero(cntr, strText) {
    var strValue = $('#' + cntr).val();
    if (strValue == "0") {
        BootstrapAlert(strText + " can not be zero", cntr);
        return false;
    }
    else
        return true;
}

function ValidatePAN(cntr) {
	
	var tPAN=$('#' + cntr).val();
    var PAN = tPAN.toUpperCase();
    if (PAN != "") {
        var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
        var code = /([C,P,H,F,A,T,B,L,J,G])/;
        var code_chk = PAN.substring(3, 4);
        if (PAN.search(panPat) == -1) {
            BootstrapAlert("Invalid Pan No", cntr);
            return false;
        }
        if (!code.test(code_chk)) {
            BootstrapAlert("Invaild PAN No.", cntr);
            return false;
        }
        else
            return true;
    }
    else
        return true;
}

var tdate = new Date();
var dd = tdate.getDate(); //yields day
var MMM = month[tdate.getMonth()]; //yields month
var yyyy = tdate.getFullYear(); //yields year
var curDate = dd + "-" + MMM + "-" + yyyy;

function CheckGreaterDate(cntr, strText) {
    var myDate = $("input#" + cntr).val();
    // alert(myDate + '===' + curDate);
    if (curDate != "") {
        var dateParts = myDate.split("-");
        var newDateStr = dateParts[1] + " " + dateParts[0] + ", " + dateParts[2];
        var cDate = new Date(newDateStr);
        //alert(cDate);
        var dateParts1 = curDate.split("-");
        var newDateStr1 = dateParts1[1] + " " + dateParts1[0] + ", " + dateParts1[2];
        var tdate = new Date(newDateStr1);
        //alert(tdate);
        if (cDate > tdate) {
            BootstrapAlert(strText + " must be less than or equal to current date", cntr);
            return false;
        }
        return true;
    }
}

function CheckLessDate(cntr, strText) {
    var myDate = $("input#" + cntr).val();
    var now = new Date();
    //alert(myDate + '===' + curDate);
    if (curDate != "") {
        var dateParts = myDate.split("-");
        var newDateStr = dateParts[1] + " " + dateParts[0] + ", " + dateParts[2];
        var cDate = new Date(newDateStr);
        //alert(cDate);
        var dateParts1 = curDate.split("-");
        var newDateStr1 = dateParts1[1] + " " + dateParts1[0] + ", " + dateParts1[2];
        var tdate = new Date(newDateStr1);
        //alert(tdate);
        if (cDate < tdate) {
            BootstrapAlert(strText + " must be greater than or equal to current date", cntr);
            return false;
        }
        return true;
    }
}


function CheckUncheckGrid() {
    var totChk = $('.RowCheck input[type="checkbox"]').length;
    var totChecked;
    $('[id$=chkSelectAll]').change(function () {
        if ($(this).is(':checked')) {
            $('.RowCheck input[type="checkbox"]').prop('checked', true);
        } else {
            $('.RowCheck input[type="checkbox"]').prop('checked', false);
        }
    });
    $('.RowCheck input[type="checkbox"]').change(function () {
        totChecked = $('.RowCheck input[type="checkbox"]:checked').length;
        if (totChecked == totChk) {
            $('[id$=chkSelectAll]').prop('checked', true);
        } else {
            $('[id$=chkSelectAll]').prop('checked', false);
        }
    });
}

function CheckTime(ctrlDate, cntrFromTime, cntrToTime) {
    var myDate = $("input#" + ctrlDate).val();
    var myFromTime = $("input#" + cntrFromTime).val();
    var myToTime = $("input#" + cntrToTime).val();
    //alert(myDate + '===' + curDate);
    if (myDate != "") {
        var dateParts = myDate.split("-");
        var newDateStr = dateParts[1] + " " + dateParts[0] + ", " + dateParts[2];
        var StartTime = new Date(newDateStr + ' ' + myFromTime);
        // alert(StartTime);       
        //        var dateParts1 = curDate.split("-");
        //        var newDateStr1 = dateParts1[1] + " " + dateParts1[0] + ", " + dateParts1[2];
        var EndTime = new Date(newDateStr + ' ' + myToTime);
        //alert(EndTime);
        var DiffTime = new Number(EndTime.getTime() - StartTime.getTime());
        if (DiffTime < 0) {
            BootstrapAlert('Out Time Can Not Be Earlier Than In Time', cntrToTime);
            //$('#txtOutTime').focus();
            return false;
        }
        return true;
    }
}

function DateDifference(Controlname1, Controlname2, DType) {
    var fromDate = $("input#" + Controlname1).val();
    var toDate = $("input#" + Controlname2).val();
    //alert(fromDate+'==='+toDate);
    if (toDate != "") {
        var dateParts = fromDate.split("-");
        var newDateStr = dateParts[1] + " " + dateParts[0] + ", " + dateParts[2];
        var fdate = new Date(newDateStr);
        // alert(fdate);
        var dateParts1 = toDate.split("-");
        var newDateStr1 = dateParts1[1] + " " + dateParts1[0] + ", " + dateParts1[2];
        var tdate = new Date(newDateStr1);
        // alert(tdate);
        var diff_date = tdate - fdate; BootstrapAlert(diff_date, '');
        var num_years = diff_date / 31536000000;
        var num_months = (diff_date % 31536000000) / 2628000000;
        var num_days = ((diff_date % 31536000000) % 2628000000) / 86400000;

        if (DType == "D") {
            return Math.floor(num_days);
        }
        if (DType == "M") {
            return Math.floor(num_months);
        }
        if (DType == "Y") {
            return Math.floor(num_years);
        }
    }
}

function GetDateDifference(fromDate, toDate, DType) {
    //alert(fromDate+'==='+toDate);    
    if (toDate != "") {
        var dateParts = fromDate.split("-");
        var newDateStr = dateParts[1] + " " + dateParts[0] + ", " + dateParts[2];
        var fdate = new Date(newDateStr);
        //alert(fdate);
        var dateParts1 = toDate.split("-");
        var newDateStr1 = dateParts1[1] + " " + dateParts1[0] + ", " + dateParts1[2];
        var tdate = new Date(newDateStr1);
        //alert(tdate);
        var diff_date = tdate - fdate;
        //alert(diff_date);
        var num_years = diff_date / 31536000000;
        var num_months = (diff_date % 31536000000) / 2628000000;
        var num_days = ((diff_date % 31536000000) % 2628000000) / 86400000;
        //alert(num_years);
        if (DType == "D") {
            return Math.floor(num_days);
        }
        if (DType == "M") {
            return Math.floor(num_months);
        }
        if (DType == "Y") {
            return Math.floor(num_years);
        }
    }
}

//========================================================================== Added by Abhijit Ojha ===========
// For checking max length (controlId, CharacterLimit, SpanId)
function chkMaxLength(e, t, n) { try { if (document.getElementById(e) != null) { e = document.getElementById(e) } if (e != null) { if (e.value[0] == " ") { e.value = e.value.substr(1, e.value.length); e.value = e.value.trim() } if (e.value.length > t) { e.value = e.value.substring(0, t); BootstrapAlert("Maximum " + t + " characters are allowed.", e); e.focus() } } n = document.getElementById(n); if (n != null) { if (e.value.length == 0) { $(n).html("Maximum " + t + " characters are allowed.") } else { $(n).html(t - e.value.length + " characters are left.") } } } catch (r) { } }
// To check decimal (controlId, DecimalPlaces)
function CheckDecimal(e, t) { try { var n = ""; var r; if (parseInt(t)) { r = t } else { r = 2 } var i = document.getElementById(e); if (i == "undefined" || i == null) { i = e } if (typeof i.value === "undefined") { n = i.innerHTML.trim() } else { n = i.value.trim() } if (n.split(".").length - 1 > 1 || n.charAt(n.length - 1) == "." || n.charAt(0) == ".") { if (typeof i.value === "undefined") { setTimeout(function () { BootstrapAlert("Please enter valid decimal !", ''); $("#" + i.getAttribute("id")).effect("shake", { direction: "left", times: 2, distance: 5 }, 800) }, 1) } else { setTimeout(function () { BootstrapAlert("Please enter valid decimal !", $(i)); $(i).focus() }, 1) } return false } else { if (n.substr(n.lastIndexOf(".") + 1, n.length).length > r && n.lastIndexOf(".") > -1) { if (typeof i.value === "undefined") { setTimeout(function () { BootstrapAlert("Only " + r + " digits are allowed after decimal !", $("#" + i.getAttribute("id"))); $("#" + i.getAttribute("id")).effect("shake", { direction: "left", times: 2, distance: 5 }, 800) }, 1) } else { setTimeout(function () { BootstrapAlert("Only " + r + " digits are allowed after decimal !", $(i)); $(i).focus() }, 1) } return false } else { return true } } } catch (s) { } }
// To make decimal (controlId, DecimalPlace)
function makeDecimal(e, t) { var n = document.getElementById(e); var r; if (parseInt(t)) { r = t } else { r = 2 } if (n == "undefined" || n == null) { n = e } if (typeof n.value === "undefined") { if (n.innerHTML.trim().length > 0) { n.innerHTML = parseFloat(n.innerHTML.trim()).toFixed(r) } } else { if (n.value.trim().length > 0) { n.value = parseFloat(n.value.trim()).toFixed(r) } } }
// Remove Initial space (controlId)
function RemoveInitialSpace(e) { var t = document.getElementById(e); if (t == "undefined" || t == null) { t = e } try { if (t.value[0] == " ") { t.value = t.value.substr(1, t.value.length); t.value = t.value.trim() } } catch (n) { } }
// Scroll to Page top
$.fn.scrollView = function () { return this.each(function () { $("html, body").animate({ scrollTop: $(this).offset().top - 20 }, 100) }) }
// Check selection of records before delete (GridViewId, CheckBoxCellNo)
function CheckBeforeDelete(e, t) {
    try {
        var n = false; $("#" + e + " tr").find("td:nth-child(" + t + ")").each(function () {
            if ($(this).find("input:checkbox").prop("checked") === true) { n = true }
        });
        if (n) {

            if (confirm(" Are you sure you want to Delete the Record(s) !")) {
                return true
            } else {
                return false
            }
        } else {
            setTimeout(function () {
                BootstrapAlert("Please select a Record to Delete !", '');
                $("#" + e + " tr").each(function () {
                    //if (!$(this).find("td:eq(" + (parseInt(t) - 1) + ")").find("input:checkbox").prop("disabled")) {
                    if ($(this).find("td:eq(" + (parseInt(t) - 1) + ")").find('.RowCheck').length > 0) {
                        $(this).find("td:eq(" + (parseInt(t) - 1) + ")").effect("highlight", { color: "#d9534f" }, 1e3)
                    }
                })
            }, 1); return false;
        }
    } catch (r) { alert(r) }
}
//Confirm delete
function BootStrapCheckBeforeDelete(e, t) {
    try {
        var n = false; $("#" + e + " tr").find("td:nth-child(" + t + ")").each(function () {
            if ($(this).find("input:checkbox").prop("checked") === true) { n = true }
        });
        if (n) {
            BootstrapDialog.confirm({
                title: 'Confirmation',
                message: 'Do you want to Delete the Record(s) ?',
                type: BootstrapDialog.TYPE_PRIMARY, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
                closable: true, // <-- Default value is false
                draggable: true, // <-- Default value is false
                btnOKLabel: 'Ok', // <-- Default value is 'OK',
                btnCancelLabel: 'Cancel', // <-- Default value is 'Cancel',
                btnOKClass: 'btn btn-primary', // <-- If you didn't specify it, dialog type will be used,
                callback: function (result) {
                    // result will be true if button was click, while it will be false if users close the dialog directly.
                    if (result) {
                        __doPostBack('btnDelete', '');
                    } else {
                    }
                }
            });

        } else {
            setTimeout(function () {
                BootstrapAlert('Please select a Record to Delete !', '');

                $("#" + e + " tr").each(function () {
                    //if (!$(this).find("td:eq(" + (parseInt(t) - 1) + ")").find("input:checkbox").prop("disabled")) {
                    if ($(this).find("td:eq(" + (parseInt(t) - 1) + ")").find('.RowCheck').length > 0) {
                        $(this).find("td:eq(" + (parseInt(t) - 1) + ")").effect("highlight", { color: "#d9534f" }, 1e3)
                    }
                })
            }, 1);
        }
    } catch (r) { alert(r) }
}
//To Check the checkbox selected in the gridview for Submit
function CheckGridSubmit(e, t, Message) {
    try {
        var n = false; $("#" + e + " tr").find("td:nth-child(" + t + ")").each(function () {
            if ($(this).find("input:checkbox").prop("checked") === true) { n = true }
        });
        if (n) {
            return true;
        }
        else {
            setTimeout(function () {
                BootstrapAlert('Please select a Record to ' + Message + ' !', '');

                $("#" + e + " tr").each(function () {
                    //if (!$(this).find("td:eq(" + (parseInt(t) - 1) + ")").find("input:checkbox").prop("disabled")) {
                    if ($(this).find("td:eq(" + (parseInt(t) - 1) + ")").find('.RowCheck').length > 0) {
                        $(this).find("td:eq(" + (parseInt(t) - 1) + ")").effect("highlight", { color: "#d9534f" }, 1e3)
                    }
                })
            }, 1); return false;
        }
    } catch (r) { alert(r) }
}
// Put Water Mark for a TextBox / TextArea (controlId, defaultValue)
function WaterMark(a, r) { try { var t = $("#" + a); ("undefined" == t || null == t) && (t = a), t.attr("placeholder", r) } catch (e) { } }
//************************************************************************************************************

//***************************Added By Tapan*********************************  
//To Check Length of a string
function checkLength(cntr, chr) {
    maxLen = chr; // max number of characters allowed            
    var strValue = $('#' + cntr).val();
    //alert(strValue); alert(strValue.length);
    if (strValue.length > maxLen) {
        // Alert message if maximum limit is reached.        
        var msg = "You have reached your maximum limit of characters allowed";
        BootstrapAlert(msg, cntr);
        // Reached the Maximum length so trim the textarea
        $('#' + cntr).val(strValue.substring(0, maxLen));
        $(".remaining").val(0);
    }
    else {
        // Maximum length not reached so update the value of my_text counter
        $(".remaining").val(maxLen - strValue.length);
    }
}

function checkLengthBySpanId(cntr, chr, spanid) {
    maxLen = chr; // max number of characters allowed            
    var strValue = $('#' + cntr).val();
    //alert(strValue); alert(strValue.length);
    if (strValue.length > maxLen) {
        // Alert message if maximum limit is reached.        
        var msg = "You have reached your maximum limit of characters allowed";
        BootstrapAlert(msg, cntr);
        // Reached the Maximum length so trim the textarea
        $('#' + cntr).val(strValue.substring(0, maxLen));
        $('#' + spanid).val(0);
    }
    else {
        // Maximum length not reached so update the value of my_text counter
        $('#' + spanid).val(maxLen - strValue.length);
    }
}


//==========================================================================


//Created by Sangram Das on 16-Dec-2014 to validate check list box control
function ValidateCheckListBox(chklist, msg) {
    try {
        var chkboxlist = $('#' + chklist + ' input:checked');
        if (chkboxlist.length > 0) {
            return true;
        }
        else {
            BootstrapAlert('Please select atleast one ' + msg, chklist);
            return false;
        }
    } catch (e) {

    }
}
//End//

//Created by Sangram Das on 16-Dec-2014 for minimum length validation
function MinimumLengthValidation(textbox, length, msg) {
    try {
        var textbox = $('#' + textbox);
        if (textbox.val().length < length) {
            BootstrapAlert("Please enter " + length + msg, textbox);

            return false;
        }
        else {
            return true;
        }

    } catch (e) {

    }
}
//End//

//================Created By Tapan on 29-dec-14 for merge table cell having equal value ===============

function groupTable($rows, startIndex, total) {
    if (total === 0) {
        return;
    }
    var i, currentIndex = startIndex, count = 1, lst = [];
    var tds = $rows.find('td:eq(' + currentIndex + ')');
    var ctrl = $(tds[0]);
    lst.push($rows[0]);
    for (i = 1; i <= tds.length; i++) {
        if (ctrl.text() == $(tds[i]).text()) {
            count++;
            $(tds[i]).addClass('deleted');
            lst.push($rows[i]);
        }
        else {
            if (count > 1) {
                ctrl.attr('rowspan', count);
                groupTable($(lst), startIndex + 1, total - 1)
            }
            count = 1;
            lst = [];
            ctrl = $(tds[i]);
            lst.push($rows[i]);
        }
    }
}
//=================End==================================
/********************************************************************!
* To prevent users from loosing unsaved form changes
* Created By : Manas Bej
* Created On : 29-DEC-2014
**********************************************************************/
(function ($) {

    $.fn.areYouSure = function (options) {

        var settings = $.extend(
      {
          'message': 'You have unsaved changes!',
          'dirtyClass': 'dirty',
          'change': null,
          'silent': false,
          'addRemoveFieldsMarksDirty': false,
          'fieldEvents': 'change keyup propertychange input',
          'fieldSelector': ":input:not(input[type=submit]):not(input[type=button])"
      }, options);

        var getValue = function ($field) {
            if ($field.hasClass('ays-ignore')
          || $field.hasClass('aysIgnore')
          || $field.attr('data-ays-ignore')
          || $field.attr('name') === undefined) {
                return null;
            }

            if ($field.is(':disabled')) {
                return 'ays-disabled';
            }

            var val;
            var type = $field.attr('type');
            if ($field.is('select')) {
                type = 'select';
            }

            switch (type) {
                case 'checkbox':
                case 'radio':
                    val = $field.is(':checked');
                    break;
                case 'select':
                    val = '';
                    $field.find('option').each(function (o) {
                        var $option = $(this);
                        if ($option.is(':selected')) {
                            val += $option.val();
                        }
                    });
                    break;
                default:
                    val = $field.val();
            }

            return val;
        };

        var storeOrigValue = function ($field) {
            $field.data('ays-orig', getValue($field));
        };

        var checkForm = function (evt) {

            var isFieldDirty = function ($field) {
                var origValue = $field.data('ays-orig');
                if (undefined === origValue) {
                    return false;
                }
                return (getValue($field) != origValue);
            };

            var $form = ($(this).is('form'))
                    ? $(this)
                    : $(this).parents('form');

            // Test on the target first as it's the most likely to be dirty
            if (isFieldDirty($(evt.target))) {
                setDirtyStatus($form, true);
                return;
            }

            $fields = $form.find(settings.fieldSelector);

            if (settings.addRemoveFieldsMarksDirty) {
                // Check if field count has changed
                var origCount = $form.data("ays-orig-field-count");
                if (origCount != $fields.length) {
                    setDirtyStatus($form, true);
                    return;
                }
            }

            // Brute force - check each field
            var isDirty = false;
            $fields.each(function () {
                $field = $(this);
                if (isFieldDirty($field)) {
                    isDirty = true;
                    return false; // break
                }
            });

            setDirtyStatus($form, isDirty);
        };

        var initForm = function ($form) {
            var fields = $form.find(settings.fieldSelector);
            $(fields).each(function () { storeOrigValue($(this)); });
            $(fields).unbind(settings.fieldEvents, checkForm);
            $(fields).bind(settings.fieldEvents, checkForm);
            $form.data("ays-orig-field-count", $(fields).length);
            setDirtyStatus($form, false);
        };

        var setDirtyStatus = function ($form, isDirty) {
            var changed = isDirty != $form.hasClass(settings.dirtyClass);
            $form.toggleClass(settings.dirtyClass, isDirty);

            // Fire change event if required
            if (changed) {
                if (settings.change) settings.change.call($form, $form);

                if (isDirty) $form.trigger('dirty.areYouSure', [$form]);
                if (!isDirty) $form.trigger('clean.areYouSure', [$form]);
                $form.trigger('change.areYouSure', [$form]);
            }
        };

        var rescan = function () {
            var $form = $(this);
            var fields = $form.find(settings.fieldSelector);
            $(fields).each(function () {
                var $field = $(this);
                if (!$field.data('ays-orig')) {
                    storeOrigValue($field);
                    $field.bind(settings.fieldEvents, checkForm);
                }
            });
            // Check for changes while we're here
            $form.trigger('checkform.areYouSure');
        };

        var reinitialize = function () {
            initForm($(this));
        }

        if (!settings.silent && !window.aysUnloadSet) {
            window.aysUnloadSet = true;
            $(window).bind('beforeunload', function () {
                $dirtyForms = $("form").filter('.' + settings.dirtyClass);
                if ($dirtyForms.length == 0) {
                    return;
                }
                // Prevent multiple prompts - seen on Chrome and IE
                if (navigator.userAgent.toLowerCase().match(/msie|chrome/)) {
                    if (window.aysHasPrompted) {
                        return;
                    }
                    window.aysHasPrompted = true;
                    window.setTimeout(function () { window.aysHasPrompted = false; }, 900);
                }
                return settings.message;
            });
        }

        return this.each(function (elem) {
            if (!$(this).is('form')) {
                return;
            }
            var $form = $(this);

            $form.submit(function () {
                $form.removeClass(settings.dirtyClass);
            });
            $form.bind('reset', function () { setDirtyStatus($form, false); });
            // Add a custom events
            $form.bind('rescan.areYouSure', rescan);
            $form.bind('reinitialize.areYouSure', reinitialize);
            $form.bind('checkform.areYouSure', checkForm);
            initForm($form);
        });
    };
})(jQuery);


/********************************************************************!
* BOOTSTRAP MODAL DIALOGS
* Created On : 07-Nov-2016
**********************************************************************/

function BootstrapAlert(msg, cntr) {
    BootstrapDialog.show({
        message: msg,
        buttons: [{
            id: 'btn-ok',
            icon: 'glyphicon glyphicon-check',
            label: 'OK',
            cssClass: 'btn-primary',
            autospin: false,
            action: function (dialogRef) {
                dialogRef.close();
            }
        }],
        onhidden: function (dialogRef) {
            if (cntr != '')
                $('#' + cntr).focus();
        }
    });
}

function BootStrapRedirect(msg, url) {
    BootstrapDialog.show({
        closable: false, // <-- Default value is false
        message: msg,
        buttons: [{
            label: 'Ok',
            cssClass: 'btn-primary',
            action: function () {
                window.location.href = url;
            }
        }]
    });
    $('.close').hide();
}

function BootStrapSubmit(cntr, msgSave, msgUpdate) {
    var Msg;
    if ($('#' + cntr).val() == 'Update') {
        Msg = msgUpdate;
    }
    else {
        Msg = msgSave;
    }
    //    BootstrapDialog.confirm(Msg, function (result) {
    //        return result;
    //    });
    BootstrapDialog.confirm({
        title: 'Confirmation',
        message: Msg,
        type: BootstrapDialog.TYPE_PRIMARY, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
        closable: true, // <-- Default value is false
        draggable: true, // <-- Default value is false
        btnOKLabel: 'Ok', // <-- Default value is 'OK',
        btnCancelLabel: 'Cancel', // <-- Default value is 'Cancel',
        btnOKClass: 'btn btn-primary', // <-- If you didn't specify it, dialog type will be used,
        callback: function (result) {
            // result will be true if button was click, while it will be false if users close the dialog directly.
            if (result) {
                __doPostBack(cntr, '');
            } else {
            }
        }
    });
}


function BootStrapValidate(cntr, msgSave, msgUpdate) {
    var Msg;
    if ($('#' + cntr).val() == 'Update') {
        Msg = msgUpdate;
    }
    else {
        Msg = msgSave;
    }
    //    BootstrapDialog.confirm(Msg, function (result) {
    //        return result;
    //    });
    BootstrapDialog.confirm({
        title: 'Confirmation',
        message: Msg,
        type: BootstrapDialog.TYPE_PRIMARY, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
        closable: true, // <-- Default value is false
        draggable: true, // <-- Default value is false
        btnOKLabel: 'Ok', // <-- Default value is 'OK',
        btnCancelLabel: 'Cancel', // <-- Default value is 'Cancel',
        btnOKClass: 'btn btn-primary', // <-- If you didn't specify it, dialog type will be used,
        callback: function (result) {
            // result will be true if button was click, while it will be false if users close the dialog directly.
            if (result) {
               
            } else {
            }
        }
    });
}






function ConfirmAction(cntr, msgSave, msgUpdate) {
    var strValue = $('#' + cntr).val();
    if (strValue == 'Update') {
        if (confirm(msgUpdate)) {
            return true;
        }
        else
            return false;
    }
    else {
        if (confirm(msgSave)) {
            return true;
        }
        else
            return false;
    }
}


 





function ConfirmDelete(msg) {
    if (confirm(msg)) {
        return true;
    }
    else
        return false;
}

/******************************/
$(document).ready(function(){
	$("#ib_error_btn").click(function(){
		$("#ib_error_box").toggleClass("hidden");
	});
	
	$("#sidebar-collapse").click(function(){
		$("#sidebar").toggleClass("menu-min");
		$("#sidebar-collapse .ace-icon").toggleClass("fa-outdent fa-indent");
	});
});








