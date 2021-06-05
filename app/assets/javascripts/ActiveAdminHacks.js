$(document).ready(function(){
	to_form_autocomplete();
	filter_autocomplete_hack();
	form_help();
	
	$("#header li#dashboard a").text("Inicio");

	$("input[type='text'], input[type='number'], input[type='email'], select").addClass("form-control");

	$(".currency").each(function(){
		$(this).maskMoney({
			prefix: "$",
			thousands: ".",
			decimal: ",",
			precision: 0,
			allowNegative: false,
			allowZero: false
		});
		$(this).maskMoney('mask');
	});
	
	$(".currency_zero").each(function(){
		$(this).maskMoney({
			prefix: "$",
			thousands: ".",
			decimal: ",",
			precision: 0,
			allowNegative: false,
			allowZero: true
		});
		$(this).maskMoney('mask');
	});
	
	$(".percent").each(function(){
		$(this).maskMoney({
			suffix: "%",
			thousands: ".",
			decimal: ",",
			precision: 0,
			allowNegative: false,
			allowZero: false
		});
		$(this).maskMoney('mask');
	});
	
	$(".percent_precision").each(function(){
		$(this).maskMoney({
			suffix: "%",
			thousands: ".",
			decimal: ",",
			precision: 1,
			allowNegative: false,
			allowZero: false
		});
		$(this).maskMoney('mask');
	});
	
	// $("#content_wrapper").ready(function(){
// 		if ($("#content_wrapper").length == 1){
// 			$("#wrapper").prepend('<div class="row">'+
// 															'<div class="col-md-6" id="login-new">'+
// 															'</div>'+
// 															'<div id="banner" class="col-md-6" style=""><img src="/assets/banner.png", style="width: 100%;" /></div>'+
// 													   '</div>');
//
// 	  	$("#content_wrapper").appendTo("#login-new");
// 			$("#login-new").siblings("div").height($(window).height());
// 			$("#banner").height($("#active_admin_content").height()+200);
//
// 			$(".flash_alert").addClass("alert");
// 			$(".flash_alert").addClass("alert-warning");
// 	  }
// 	});
	
	setDatePicker();
});
function form_help(){
	$(".input-help, .input-help-no-width").addClass("input-group");
	$(".input-help").css({
			width: "100%"
	});
	$(".input-group").find("input, select, textarea").each(function(){
		$(this).css({
			width: "100%"
		});
	});
	
	$(".input-group, .form-inline").each(function(){
		var content = $(this).find("tooltip").html();
		$(this).find("button").tooltip({
			trigger: 'hover',
			html: true,
			placement: 'top',
			title: content,
			container: 'body'
		});
	});
	
	$("td.col-actions, td.col-acciones").each(function(){
		$(this).append('<div class="btn-group"></div');
		var btns = $(this).find(".btn-group");
		var view = $(this).find(".view_link");
		var edit = $(this).find(".edit_link");
		var _delete = $(this).find(".delete_link");
		
		view.addClass("btn").addClass("btn-default").removeClass("member_link").appendTo(btns);
		edit.addClass("btn").addClass("btn-primary").removeClass("member_link").appendTo(btns);
		_delete.addClass("btn").addClass("btn-danger").removeClass("member_link").appendTo(btns);
		
	});

}

function filter_autocomplete_hack(){
	var self = $(".filter_select_to_autocomplete");
	var self_id = self.attr("id");
	var self_name = self.attr("name");
	var parent = self.parent();
	var model = self.data("model");
	self.remove();
	
	var to_append = '<input id="filter_autocomplete_string" type="text" placeholder="Escribe y apareceran las opciones"/>' + 
									'<input type="hidden" id="'+self_id+'" name="'+self_name+'" />';
									
	parent.append(to_append);
	
	if (model == "user"){
		is_autocomplete("/autocomplete/users", $("#filter_autocomplete_string"), "", function(ui){
			$("#"+self_id).val(ui.item.id);
			$("#"+self_id).trigger('change');
		});
	}
	else if(model == "client_product"){
		is_autocomplete("/autocomplete/client_products", $("#filter_autocomplete_string"), "", function(ui){
			$("#"+self_id).val(ui.item.id);
			$("#"+self_id).trigger('change');
		});
	}
	else if(model == "product"){
		is_autocomplete("/references/autocomplete_products", $("#filter_autocomplete_string"), "", function(ui){
			$("#"+self_id).val(ui.item.id);
			$("#"+self_id).trigger('change');
		});
	}
	else if (model == "category"){
		
	}
}

function toTitleCase(str)
{
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}

function to_form_autocomplete(){
	
	$(".is_form_autocomplete").each(function(){
		var input = $(this);
		is_autocomplete(input.data("source"), input, input.data("extras"), function(ui){
			$(input.data("input")).val(ui.item.id);
			$(input.data("input")).change();
		});
	});
}

function new_to_form_autocomplete(input){
	is_autocomplete(input.data("source"), input, input.data("extras"), function(ui){
		$(input.data("input")).val(ui.item.id);
		$(input.data("input")).change();
	});
}

function is_autocomplete(method, input, extras, callback){
	input.autocomplete({
    source: location.protocol + '//' + location.host + method + ".json" + extras,
    minLength: 2,
    select: function( event, ui ) {
				callback(ui);
    }
  });
}

function ajax_error(res){
	alert("Error de conexion "+res);
}

function loadFormErrors(model, aErrors){

	var form = $("form");
	form.find("input, select, textarea").each(function(){
		var input = $(this);
		var aName = input.attr("id");
		var label = $("label[for='"+aName+"']").text();
		if (aName != null && aName != undefined){
			var name = aName.split(model+"_");
			var error_msg = aErrors[name[1]];
			if (error_msg != null && error_msg != undefined){
				if (input.parent().hasClass("input-help") || input.parent().hasClass("input-help-no-width")){
					var html = '<span class="input-group-btn">'+
					        '<button class="btn btn-danger" type="button" data-toggle="tooltip"><i class="glyphicon glyphicon-exclamation-sign"></i></button>'+
									'<tooltip style="display: none;">'+
										'<p><b>Campo '+label+':</b><br />'+
										error_msg+'.</p>'+
									'</tooltip>'+
					      '</span>';
				}
				else if (input.parent().hasClass("form-inline")){
					var html = '<button class="btn btn-danger" type="button" data-toggle="tooltip"><i class="glyphicon glyphicon-exclamation-sign"></i></button>'+
								 '<tooltip style="display: none;">'+
										'<p><b>Campo Descripci&oacute;n:</b><br />'+
										error_msg+'.</p>'+
								 '</tooltip>';
				}
			
				if (html){
					input.before(html);
					input.addClass("input-error");
	
					input.focusin(function(){
						$(this).removeClass("input-error");
					});
				}
			}			
		}
	});
}



function setDatePicker(){
	$('.datepicker').datepicker({
	    format: 'yyyy-mm-dd',
			weekStart: 1,
			language: 'es'
	    }).on('changeDate', function (ev) {
	    	$(this).datepicker('hide');
	});
  	
	$('.datepicker').datepicker('setStartDate', getToday());
	$('.btn-datepicker').each(function(){
		$(this).click(function(){
			$dp = $(this).parent().parent().find($('.datepicker'));
			$dp.datepicker('show');
		});
	});
}

function getToday(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	return yyyy+'/'+mm+'/'+dd;
}
