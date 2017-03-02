var table = null,
	tblRawbillVersions = null,
	timeout = 50000
;

// $(document).ready(function () {
$(document).on('turbolinks:load', function () {
	table = $('#tblRawbillsIndex').DataTable({
		dom: 'lfrtip<B>',
		aLengthMenu: [
			[10, 25, 50, 100, 200, 500, 1000, -1],
			[10, 25, 50, 100, 200, 500, 1000, "All"]
		],
		iDisplayLength: -1,
		buttons: [
			'copy',
			'csv',
			'excel',
			{
				text: 'Criar em Massa',
				action: function (e, dt, node, config) {
					// "<a href="/rawbills/4042">Show</a> | <a href="/rawbills/4042/edit">Edit</a> | <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/rawbills/4042">Destroy</a>"
					var data = table.rows({selected: true}).data(),
						bulk = []
					;
					data.each(function (row) {
						// bulk.push(row[10].match(/<a href=\"\/rawbills\/[0-9]+\">/)[0].match(/[0-9]+/)[0]);
						bulk.push(row[10].match(/href=\"\/rawbills\/[0-9]+\">/)[0].match(/[0-9]+/)[0]);
					});
					console.log("final bulk of rawbill");
					console.log(bulk);

					$.ajax({
						url: "/rawbills/create_bulk.json",
						data: {
							rawbill_ids: bulk
						},
						type: 'POST',
						async: true,
						cache: false,
						timeout: timeout,
						error: function(data) {
							console.error(data);
							// TODO inform user of this error
							// table.row.add([
							// 	value,
							// 	"ERROR!",
							// 	"ERROR!",
							// 	"ERROR!",
							// 	"ERROR!",
							// 	"ERROR!",
							// 	"ERROR!",
							// 	"ERROR!"
							// ]).draw();
							
							return true;
						},
						success: function(data) {
							console.log(data);
							// TODO update row with success
							window.location.href = "/rawbills";
							// table.row.add([
							// 	data.ip,
							// 	data.name,
							// 	data.actualProduction,
							// 	data.serialNumber,
							// 	data.printerType,
							// 	data.physicalSite,
							// 	data.contato,
							// 	data.mac
							// ]).draw();
						}
					});
				}
			},
			{
				text: 'Criar em Massa IMPRESSORAS',
				action: function (e, dt, node, config) {
					// "<a href="/rawbills/4042">Show</a> | <a href="/rawbills/4042/edit">Edit</a> | <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/rawbills/4042">Destroy</a>"
					var data = table.rows({selected: true}).data(),
						bulk = []
					;
					data.each(function (row) {
						bulk.push(row[10].match(/<a href=\"\/rawbills\/[0-9]+\">Show<\/a>/)[0].match(/[0-9]+/)[0]);
					});
					console.log("final bulk of rawbill PRINTER");
					console.log(bulk);

					$.ajax({
						url: "/rawbills/create_bulk_printer.json",
						data: {
							rawbill_ids: bulk
						},
						type: 'POST',
						async: true,
						cache: false,
						timeout: timeout,
						error: function(data) {
							console.error(data);
							// TODO inform user of this error
							// table.row.add([
							// 	value,
							// 	"ERROR!",
							// 	"ERROR!",
							// 	"ERROR!",
							// 	"ERROR!",
							// 	"ERROR!",
							// 	"ERROR!",
							// 	"ERROR!"
							// ]).draw();
							
							return true;
						},
						success: function(data) {
							console.log(data);
							// TODO update row with success
							window.location.href = "/rawbills";
							// table.row.add([
							// 	data.ip,
							// 	data.name,
							// 	data.actualProduction,
							// 	data.serialNumber,
							// 	data.printerType,
							// 	data.physicalSite,
							// 	data.contato,
							// 	data.mac
							// ]).draw();
						}
					});
				}
			}
		],
		select: true
	});

	tblRawbillVersions = $('#tblRawbillVersions').DataTable({
		dom: 'lfrtip<B>',
		aLengthMenu: [
			[10, 25, 50, -1],
			[10, 25, 50, "All"]
		],
		iDisplayLength: -1,
		buttons: [
			'copy',
			'csv',
			'excel',
			'colvis'
		],
		select: true,
		scrollX: true,
		scrollCollapse: true,
        paging: false,
		fixedColumns: true,
		fixedColumns:   {
            leftColumns: 3
        },
		rowReorder: true,
		colReorder: false
	});
});
