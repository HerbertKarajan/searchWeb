/**
 * 分页插件
	$(".pager").ucPager({
		currentPage  : "当前页",				
		totalPage    : "总页数",				
		pageSize     : "每页显示的记录数",			
		clickCallback: cback				//分页回调方法
	})
 */
(function($){
	var pageNav = {
		pre : "上一页",
		next : "下一页",
		nav : function(p, pn) {
			var html = "";
			if (pn <= 1 || p > pn) {
				html = this.pager(1, 1);
			} else {
				html += (p == 1) ? this.showPre(0) : this.showPre(1, p);
				if (pn > 6) {
					var c = 1;
					if (p >= 5 && p <= pn) {
						html += (p == 1) ? this.numStatusHTML(0, 1) : this.numStatusHTML(1, 1);
					} else {
						for ( var i = 1; i < 4; i++) {
							html += (p == i) ? this.numStatusHTML(0, i) : this.numStatusHTML(1, i);
						}
					}
					html += (p >= 5) ? "<span class='placeholder'></span>" : "";
					c = p - 2; if (c >= 3 && c < pn - 2) html += (p == c) ? this.numStatusHTML(0, c) : this.numStatusHTML(1, c);
					c = p - 1; if (c > 3 && c < pn - 2) html += (p == c) ? this.numStatusHTML(0, c) : this.numStatusHTML(1, c);
					c = p;     if (c > 3 && c < pn - 2) html += (p == c) ? this.numStatusHTML(0, c) : this.numStatusHTML(1, c);
					c = p + 1; if (c > 3 && c < pn - 2) html += (p == c) ? this.numStatusHTML(0, c) : this.numStatusHTML(1, c);
					c = p + 2; if (c > 3 && c < pn - 2) html += (p == c) ? this.numStatusHTML(0, c) : this.numStatusHTML(1, c);
					html += (p <= pn - 4) ? "<span class='placeholder'></span>" : "";
					if (p <= pn - 4) {
						html += (p == pn) ? this.numStatusHTML(0, pn) : this.numStatusHTML(1, pn);
					} else {
						for ( var i = pn - 2; i <= pn; i++) {
							html += (p == i) ? this.numStatusHTML(0, i) : this.numStatusHTML(1, i);
						}
					}
				} else {
					for ( var i = 1; i <= pn; i++) {
						html += (p == i) ? this.numStatusHTML(0, i) : this.numStatusHTML(1, i);
					}
				}
				html += (p == pn) ? this.showNext(0) : this.showNext(1, p);
			}
			return html;
		},
		pager : function(p, pn) {
			var html = "";
			if (pn <= 1) {
				this.p = p;
				this.pn = pn;
				html = this.showPre(0) + this.numStatusHTML(0, p) + this.showNext(0);
			}
			return html;
		},
		go : function(p, pn) {
			var html = this.nav(p, pn) + this.btnHTML(p, pn);
			return html;
		},
		numStatusHTML : function(t, p) {
			return (t == 0) ? ("<span class='cur'>" + p + "</span>") : "<a href='javascript:void(0);' onclick='javascript:doPageNumSearch("	+ p + ");return false;'>" + p + "</a>";
		},
		showPre : function(t, p) {
			var $disable = "<a class='prev disable' href='javascript:void(0);'>&nbsp;"
				+ this.pre + "<s class='icon-prev'></s><i></i></a>";
			var $able = "<a class='prev' href='javascript:void(0);' onclick='javascript:doPageNumSearch("
				+ (p - 1) + ");return false;'>&nbsp;" + this.pre
				+ "<s class='icon-prev'></s><i></i></a>";
			return (t == 0) ? $disable : $able;
		},
		showNext : function(t, p) {
			var $disable = "<a class='next disable' href='javascript:void(0);'>"
				+ this.next + "<s class='icon-next'></s><i></i></a>";
			var $able = "<a class='next' href='javascript:void(0);' onclick='javascript:doPageNumSearch("
				+ (p + 1) + ");return false;'>" + this.next + "<s class='icon-next'></s><i></i></a>";
			return (t == 0) ? $disable : $able;
		},
		btnHTML : function(p, pn) {
			var html = "<label for='pagenum' class='txt-wrap'>到<input type='text' id='pNum' class='txt' bNum='"+ pn +"' value='" + p + "'>页</label>"
				+ "<a href='javascript:void(0)' zdx='nBtn' class='btn'>确定</a>";
			return html;
		}
	};
	$.fn.extend({
		ucPager: function(options) {
			var op = $.extend({currentPage:1,totalPage:0,pageSize:15,clickCallback:function(){}},options);

			return this.each(function() {
				var $this = $(this);

				var clickCallback = function() {
					op.clickCallback(op.currentPage);
					//$this.html(pageNav.go(op.currentPage, op.totalPage));
				}

				$this.html(pageNav.go(op.currentPage, op.totalPage));


				//翻页
				window.doPageNumSearch = function(p){  //p当前页数
					op.currentPage = p.toString();
					clickCallback();
				};
				//删除订单不刷新，执行下一页20150824
				window.doNextPageNum = function(lenOtbody){  //执行下一页；

					if(op.currentPage==op.totalPage){
						//doPrevPageNum();
						op.currentPage --;

					}else{
						op.currentPage ++;
					}

					doPageNumSearch(op.currentPage);
				};


				var $pNum = $("#pNum", $this);

				$pNum.on('keyup', function(event){
					var val = $(this).val(), reg1 = /^\d+$/ig, reg2 = /\d+/ig;
					if (event.which == 13) {
						$('.btn',$this).click();
					} else {
						if(!reg1.test(val)){
							$(this).val(val.match(reg2) ? val.match(reg2)[0] : '');
						};
					}

				})

				$('.btn',$this).bind('click',function(){
					var $val = $.trim($pNum.val());
					if($val<1){
						$pNum.val(1);
						op.currentPage = 1 + '';
					}else if($val>op.totalPage){
						$pNum.val(op.totalPage);
						op.currentPage = op.totalPage.toString();
					}else{
						$pNum.val($val);
						op.currentPage = $val;
					};

					clickCallback();
				});

			});
		}
	})
})(jQuery);
