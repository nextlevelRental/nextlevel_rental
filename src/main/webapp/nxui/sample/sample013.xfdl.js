(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        this.on_create = function()
        {
            // Declare Reference
            var obj = null;
            
            if (Form == this.constructor) {
                this.set_name("sample013");
                this.set_classname("SAMPL00068_탭이동시그리드값유지");
                this.set_titletext("공통Message창호출");
                this._setFormPosition(0,0,1260,641);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_message", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"MSG_CD\" type=\"string\" size=\"32\"/><Column id=\"MSG_TYPE\" type=\"string\" size=\"32\"/><Column id=\"MSG_NM\" type=\"string\" size=\"32\"/><Column id=\"MSG_NOTE\" type=\"string\" size=\"32\"/></ColumnInfo><Rows><Row><Col id=\"MSG_CD\">fail.common.msg</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">error ocurred!</Col></Row><Row><Col id=\"MSG_CD\">fail.common.sql</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">sql error ocurred! error code: {0}, error msg: {1}</Col></Row><Row><Col id=\"MSG_CD\">info.nodata.msg</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">no data found.</Col></Row><Row><Col id=\"MSG_CD\">button.search</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Search</Col></Row><Row><Col id=\"MSG_CD\">image.search</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">btn_form_search_en.gif</Col></Row><Row><Col id=\"MSG_CD\">image.errorBg</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">error_en</Col></Row><Row><Col id=\"MSG_CD\">errors.prefix</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">&lt;div class\\=&quot;error&quot;&gt; </Col></Row><Row><Col id=\"MSG_CD\">errors.suffix</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">&lt;/div&gt;&lt;br/&gt;</Col></Row><Row><Col id=\"MSG_CD\">errors.required</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} is required.</Col></Row><Row><Col id=\"MSG_CD\">purchase.inspection.vendor</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Please enter Vendor.</Col></Row><Row><Col id=\"MSG_CD\">purchase.inspection.vendor_contact</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Please enter a Vendor Contact.</Col></Row><Row><Col id=\"MSG_CD\">purchase.inspection.phone</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Please enter a Phone No.</Col></Row><Row><Col id=\"MSG_CD\">purchase.inspection.fax</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Please enter a Fax No.</Col></Row><Row><Col id=\"MSG_CD\">purchase.inspection.email</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Please enter an Email.</Col></Row><Row><Col id=\"MSG_CD\">purchase.inspection.address</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Please enter an Address.</Col></Row><Row><Col id=\"MSG_CD\">purchase.inspection.expected_input_costs</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Please enter Expected Costs.</Col></Row><Row><Col id=\"MSG_CD\">btn.modify</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Save</Col></Row><Row><Col id=\"MSG_CD\">btn.list</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">List</Col></Row><Row><Col id=\"MSG_CD\">btn.delete</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Remove</Col></Row><Row><Col id=\"MSG_CD\">success.insert</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Transaction has been completed successfully.</Col></Row><Row><Col id=\"MSG_CD\">success.update</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Transaction has been completed successfully.</Col></Row><Row><Col id=\"MSG_CD\">success.delete</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Transaction has been completed successfully.</Col></Row><Row><Col id=\"MSG_CD\">success.select</Col><Col id=\"MSG_TYPE\">PU</Col><Col id=\"MSG_NM\">Transaction has been completed successfully.</Col></Row><Row><Col id=\"MSG_CD\">sale.order.neworder.delete.error</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">You cannot delete all the items.</Col></Row><Row><Col id=\"MSG_CD\">sale.order.neworder.hgrCredit.error</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">Please check HGR Credit.</Col></Row><Row><Col id=\"MSG_CD\">sale.order.order.cancel.check</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">Do you want to cancel?</Col></Row><Row><Col id=\"MSG_CD\">sale.order.purchaseRequest.confirm.error</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">You cannot Confirm Request. Please cancel.</Col></Row><Row><Col id=\"MSG_CD\">sale.order.delivery.chk.error</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">Please select an Item.</Col></Row><Row><Col id=\"MSG_CD\">sale.return.refundmethod.choice.error</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">Please select the return method.</Col></Row><Row><Col id=\"MSG_CD\">sale.return.finishPay.choice.error</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">Please select a payment status.</Col></Row><Row><Col id=\"MSG_CD\">sale.return.returnQty.out.error</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">Please select the Quantity of Returns.</Col></Row><Row><Col id=\"MSG_CD\">sale.order.scrap.amount.error</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">Price is incorrect.</Col></Row><Row><Col id=\"MSG_CD\">sale.order.not.add</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">Add items not available.</Col></Row><Row><Col id=\"MSG_CD\">sale.length.check.error</Col><Col id=\"MSG_TYPE\">SA</Col><Col id=\"MSG_NM\">Please check the number of digits of {0}</Col></Row><Row><Col id=\"MSG_CD\">system.message.unselected.data</Col><Col id=\"MSG_TYPE\">SY</Col><Col id=\"MSG_NM\">Please select Data.</Col></Row><Row><Col id=\"MSG_CD\">system.message.menu.data</Col><Col id=\"MSG_TYPE\">SY</Col><Col id=\"MSG_NM\">Please enter {0}.</Col></Row><Row><Col id=\"MSG_CD\">system.message.parent.data</Col><Col id=\"MSG_TYPE\">SY</Col><Col id=\"MSG_NM\">Please select a Parent Menu.</Col></Row><Row><Col id=\"MSG_CD\">system.message.access-name.data</Col><Col id=\"MSG_TYPE\">SY</Col><Col id=\"MSG_NM\">Please enter an Access Name.</Col></Row><Row><Col id=\"MSG_CD\">system.message.access.data</Col><Col id=\"MSG_TYPE\">SY</Col><Col id=\"MSG_NM\">Please select Access.</Col></Row><Row><Col id=\"MSG_CD\">system.message.board.title.data</Col><Col id=\"MSG_TYPE\">SY</Col><Col id=\"MSG_NM\">Please select a Title.</Col></Row><Row><Col id=\"MSG_CD\">system.message.board.content.data</Col><Col id=\"MSG_TYPE\">SY</Col><Col id=\"MSG_NM\">Please enter the Content.</Col></Row><Row><Col id=\"MSG_CD\">system.message.board.question.data</Col><Col id=\"MSG_TYPE\">SY</Col><Col id=\"MSG_NM\">Please enter a Question.</Col></Row><Row><Col id=\"MSG_CD\">system.message.board.answer.data</Col><Col id=\"MSG_TYPE\">SY</Col><Col id=\"MSG_NM\">Please enter the Answer.</Col></Row><Row><Col id=\"MSG_CD\">system.scrap.material.rate.error</Col><Col id=\"MSG_TYPE\">SY</Col><Col id=\"MSG_NM\">Retail Rate does not exceed 100.</Col></Row><Row><Col id=\"MSG_CD\">vcrm.message.vendor.manager</Col><Col id=\"MSG_TYPE\">VC</Col><Col id=\"MSG_NM\">Plase Select a Vendor Manager!</Col></Row><Row><Col id=\"MSG_CD\">vcrm.message.bulk.select</Col><Col id=\"MSG_TYPE\">VC</Col><Col id=\"MSG_NM\">Please select a target allocation.</Col></Row><Row><Col id=\"MSG_CD\">vcrm.message.source.select</Col><Col id=\"MSG_TYPE\">VC</Col><Col id=\"MSG_NM\">Please select a source type allocation.</Col></Row><Row><Col id=\"MSG_CD\">vcrm.message.compare_source.select</Col><Col id=\"MSG_TYPE\">VC</Col><Col id=\"MSG_NM\">Please select a compare source type allocation.</Col></Row><Row><Col id=\"MSG_CD\">transaction.complete</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Transaction has been completed successfully.</Col></Row><Row><Col id=\"MSG_CD\">comm.select.message</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Please select {0}</Col></Row><Row><Col id=\"MSG_CD\">comm.list.select.message</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Please select from the list.</Col></Row><Row><Col id=\"MSG_CD\">success.complete</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} has been completed successfully.</Col></Row><Row><Col id=\"MSG_CD\">comm.select.not.found</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">There is no data.</Col></Row><Row><Col id=\"MSG_CD\">start.date.input</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Please enter start date.</Col></Row><Row><Col id=\"MSG_CD\">comm.input.message</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Please enter {0}</Col></Row><Row><Col id=\"MSG_CD\">common.date.range</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Please configure the date again.</Col><Col id=\"MSG_NOTE\">검색일자 기간체크</Col></Row><Row><Col id=\"MSG_CD\">comm.validation.message</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} is invalid.</Col></Row><Row><Col id=\"MSG_CD\">comm.print.barcode</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Want to print bar codes?</Col></Row><Row><Col id=\"MSG_CD\">main.title</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">:: HGR Industrial Surplus - We Buy  Everything! ::</Col></Row><Row><Col id=\"MSG_CD\">main.negotiation</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Looks back on 30 minutes after</Col></Row><Row><Col id=\"MSG_CD\">test</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">ttttttt</Col><Col id=\"MSG_NOTE\">1111111</Col></Row><Row><Col id=\"MSG_CD\">comm.button.message</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Please click the {0} button.</Col></Row><Row><Col id=\"MSG_CD\">comm.success.complete</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} has been completed successfully.</Col></Row><Row><Col id=\"MSG_CD\">comm.register</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Please save {0} information.</Col></Row><Row><Col id=\"MSG_CD\">comm.already.registered</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} already exists.</Col></Row><Row><Col id=\"MSG_CD\">comm.register.fail</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Failed to register. Please try again.</Col></Row><Row><Col id=\"MSG_CD\">common.date.input</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Please enter date.</Col></Row><Row><Col id=\"MSG_CD\">success.inspection.complete</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Inspection has been completed</Col></Row><Row><Col id=\"MSG_CD\">success.bid.complete</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Bid has been completed</Col></Row><Row><Col id=\"MSG_CD\">success.createoffer.complete</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Create Offer has been completed</Col></Row><Row><Col id=\"MSG_CD\">success.po.complete</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">PO has been completed</Col></Row><Row><Col id=\"MSG_CD\">success.revised.complete</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Revised Offer has been completed</Col></Row><Row><Col id=\"MSG_CD\">success.exception.complete</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Exception has been completed</Col></Row><Row><Col id=\"MSG_CD\">hr.user.password</Col><Col id=\"MSG_TYPE\">HR</Col><Col id=\"MSG_NM\">Please check your password.</Col></Row><Row><Col id=\"MSG_CD\">accounting.account_name.input.error</Col><Col id=\"MSG_TYPE\">AC</Col><Col id=\"MSG_NM\">Please enter Account Name.</Col></Row><Row><Col id=\"MSG_CD\">hr.recruit.nonselect</Col><Col id=\"MSG_TYPE\">HR</Col><Col id=\"MSG_NM\">Please select one or more.</Col></Row><Row><Col id=\"MSG_CD\">accounting.settlement.amount.error</Col><Col id=\"MSG_TYPE\">AC</Col><Col id=\"MSG_NM\">Please check the amount.</Col></Row><Row><Col id=\"MSG_CD\">accounting.settlement.invoiceNum.error</Col><Col id=\"MSG_TYPE\">AC</Col><Col id=\"MSG_NM\">Please check Invoice Number.</Col></Row><Row><Col id=\"MSG_CD\">hr.recruit.multiselect</Col><Col id=\"MSG_TYPE\">HR</Col><Col id=\"MSG_NM\">Please select one or more.</Col></Row><Row><Col id=\"MSG_CD\">messaging.survey.input.error</Col><Col id=\"MSG_TYPE\">ME</Col><Col id=\"MSG_NM\">Please enter a Question.</Col></Row><Row><Col id=\"MSG_CD\">messaging.survey.date</Col><Col id=\"MSG_TYPE\">ME</Col><Col id=\"MSG_NM\">Please enter start date.</Col></Row><Row><Col id=\"MSG_CD\">comm.data.not.changed</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">The data has not changed.</Col></Row><Row><Col id=\"MSG_CD\">comm.confirm.save</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Do you want to save?</Col></Row><Row><Col id=\"MSG_CD\">errors.minnumber</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0}항목은 {1}이상 입력하셔야 합니다.</Col></Row><Row><Col id=\"MSG_CD\">errors.maxnumber</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0}항목은 {1}이하 입력하셔야 합니다.</Col></Row><Row><Col id=\"MSG_CD\">errors.minnumber.row</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0}항목은 {1}{2}이상 입력하셔야 합니다.</Col></Row><Row><Col id=\"MSG_CD\">errors.maxnumber.row</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0}항목은 {1}{2}이하 입력하셔야 합니다.</Col></Row><Row><Col id=\"MSG_CD\">accounting.code.delete.error</Col><Col id=\"MSG_TYPE\">AC</Col><Col id=\"MSG_NM\">You cannot delete the existing value.</Col></Row><Row><Col id=\"MSG_CD\">accounting.settlement.cust_id.error</Col><Col id=\"MSG_TYPE\">AC</Col><Col id=\"MSG_NM\">Please enter cust id</Col></Row><Row><Col id=\"MSG_CD\">accounting.settlement.pre_amt.error</Col><Col id=\"MSG_TYPE\">AC</Col><Col id=\"MSG_NM\">Payment must be more than the Pre-Paid Expense at most.</Col></Row><Row><Col id=\"MSG_CD\">accounting.misccost.error</Col><Col id=\"MSG_TYPE\">AC</Col><Col id=\"MSG_NM\">Please select a PO number.</Col></Row><Row><Col id=\"MSG_CD\">accounting.ap_amt.error</Col><Col id=\"MSG_TYPE\">AC</Col><Col id=\"MSG_NM\">Current Amount Due is at the maximum.</Col></Row><Row><Col id=\"MSG_CD\">accounting.account_code.input.error</Col><Col id=\"MSG_TYPE\">AC</Col><Col id=\"MSG_NM\">Please enter an Account Code.</Col></Row><Row><Col id=\"MSG_CD\">errors.minlength</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} can not be less than {1} characters.</Col></Row><Row><Col id=\"MSG_CD\">errors.maxlength</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} can not be greater than {1} characters.</Col></Row><Row><Col id=\"MSG_CD\">errors.invalid</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} is invalid.</Col></Row><Row><Col id=\"MSG_CD\">errors.byte</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} must be a byte.</Col></Row><Row><Col id=\"MSG_CD\">errors.short</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} must be a short.</Col></Row><Row><Col id=\"MSG_CD\">errors.integer</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} must be an integer.</Col></Row><Row><Col id=\"MSG_CD\">errors.long</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} must be a long.</Col></Row><Row><Col id=\"MSG_CD\">errors.float</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} must be a float.</Col></Row><Row><Col id=\"MSG_CD\">errors.double</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} must be a double.</Col></Row><Row><Col id=\"MSG_CD\">errors.date</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} is not a date.</Col></Row><Row><Col id=\"MSG_CD\">errors.range</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} is not in the range {1} through {2}.</Col></Row><Row><Col id=\"MSG_CD\">errors.creditcard</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} is an invalid credit card number.</Col></Row><Row><Col id=\"MSG_CD\">errors.email</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} is an invalid e-mail address.</Col></Row><Row><Col id=\"MSG_CD\">errors.ihidnum</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">An invalid Social Security Number.</Col></Row><Row><Col id=\"MSG_CD\">errors.korean</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} must be a Korean.</Col></Row><Row><Col id=\"MSG_CD\">title.sample.name</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Category Name</Col></Row><Row><Col id=\"MSG_CD\">title.sample.description</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Description</Col></Row><Row><Col id=\"MSG_CD\">title.sample.regUser</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">User Name</Col></Row><Row><Col id=\"MSG_CD\">inventory.item.nonselect</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please select an item</Col></Row><Row><Col id=\"MSG_CD\">inventory.itemization.noinput.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please enter an item first.</Col></Row><Row><Col id=\"MSG_CD\">inventory.itemization.completeBeforeSave.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please complete the information after saveing.</Col></Row><Row><Col id=\"MSG_CD\">inventory.unloading.complete</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Have you completed all the required information?</Col></Row><Row><Col id=\"MSG_CD\">inventory.unloading.ros.noauth</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Authority available.</Col></Row><Row><Col id=\"MSG_CD\">inventory.unloading.before.complete</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please complete the information after saveing.</Col></Row><Row><Col id=\"MSG_CD\">inventory.itemization.complete</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Have you completed all the required information?</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.status.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">You cannot request the item.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.checkbox.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please select at least two item.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.delcheck.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">You cannot delete any items.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.sameitem.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Item already exists.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.price.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please enter Amount</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.org_price.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Original price does not exist.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.micro.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please enter a Micro-itemization item.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.macro.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please enter a Macro-itemization item.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.pre.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please enter a Pre-itemization item.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.ms.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please enter a Manager-special item.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.ms.date.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please set the Manager-special period.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.ms.price.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please enter the Manager-special price.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.li.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please enter the Quantity.</Col></Row><Row><Col id=\"MSG_CD\">inventory.reitemization.li.currqty.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Quantity is incorrect.</Col></Row><Row><Col id=\"MSG_CD\">inventory.barcode.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">An error has occurred.</Col></Row><Row><Col id=\"MSG_CD\">inventory.item.image.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Value is incorrect.</Col></Row><Row><Col id=\"MSG_CD\">inventory.barcode.search.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Please enter at least one.</Col></Row><Row><Col id=\"MSG_CD\">inventory.itemization.receiveQty.zero.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Recive Qty must be greater than zero.</Col></Row><Row><Col id=\"MSG_CD\">inventory.itemization.receiveQty.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Recive Qty is less than or equal to the qty.</Col></Row><Row><Col id=\"MSG_CD\">inventory.success.insert.qna</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Do you want to save?</Col></Row><Row><Col id=\"MSG_CD\">inventory.success.update.qna</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Do you want to save?</Col></Row><Row><Col id=\"MSG_CD\">inventory.success</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Process has been completed successfully.</Col></Row><Row><Col id=\"MSG_CD\">inventory.image.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Image mapping can be done for the register items only.</Col></Row><Row><Col id=\"MSG_CD\">inventory.imagemapping.status.error</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">This item is not available for image mapping.</Col></Row><Row><Col id=\"MSG_CD\">inventory.item.loading</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">Work in progress. Please wait.</Col></Row><Row><Col id=\"MSG_CD\">inventory.detail.not.view</Col><Col id=\"MSG_TYPE\">IN</Col><Col id=\"MSG_NM\">No additional product details</Col></Row><Row><Col id=\"MSG_CD\">errors.number</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} must be a number.</Col></Row><Row><Col id=\"MSG_CD\">errors.required.column</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} 행의 {1} 은(는) 필수 입력 입니다.</Col></Row><Row><Col id=\"MSG_CD\">errors.number.row</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} 번째 줄의 ({1}) 숫자형이 아닙니다.</Col></Row><Row><Col id=\"MSG_CD\">errors.minlength.row</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} 번째 줄의 {1} {2}  글자이상으로 입력하셔야 합니다.</Col></Row><Row><Col id=\"MSG_CD\">errors.maxlength.row</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0) 번째 줄의 {1} {2}  글자이하로 입력하셔야 합니다.</Col></Row><Row><Col id=\"MSG_CD\">comm.confirm.want</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">Do you want to {0}?</Col></Row><Row><Col id=\"MSG_CD\">errors.dismatch</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0} 아닙니다. {1} 확인하세요</Col></Row><Row><Col id=\"MSG_CD\">errors.zero.row</Col><Col id=\"MSG_TYPE\">CO</Col><Col id=\"MSG_NM\">{0}번째 줄의{1} '0'이 아닙니다.</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new GroupBox("GroupBox00", "absolute", "44", "50", null, "206", "0", null, this);
            obj.set_text("Example");
            obj.set_taborder("13");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "56", "69", null, "179", "0", null, this);
            obj.set_text("** 공통메세지를 사용하는 방법 샘플\r\n* @param {string} message id\r\n* @param {string} callbackId\r\n* @param {array} msgArr[](메세지값으로 치환될 Parameter Array)\r\n* @param {string} meesage type (\"error\", \"question\", \"warning\", \"information\" (default))\r\n* @param {string} max, middle (defalut:min);");
            obj.style.set_background("#ffd70055");
            obj.style.set_padding("5 5 5 5");
            obj.set_cssclass("sample_example");
            this.addChild(obj.name, obj);

            obj = new Button("btnAlert_warning", "absolute", "30", "362", "184", "27", null, null, this);
            obj.set_taborder("6");
            obj.set_text("공통alert(warning)");
            this.addChild(obj.name, obj);

            obj = new Button("btnAlert_informationMiddle", "absolute", "30", "458", "184", "27", null, null, this);
            obj.set_taborder("7");
            obj.set_text("공통alert(information_middle)");
            this.addChild(obj.name, obj);

            obj = new Button("btnAlert_max", "absolute", "30", "490", "184", "27", null, null, this);
            obj.set_taborder("8");
            obj.set_text("공통alert(error_max)");
            this.addChild(obj.name, obj);

            obj = new Button("btnConfirm_default", "absolute", "494", "331", "194", "24", null, null, this);
            obj.set_taborder("9");
            obj.set_text("공통confirm(default)");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "41", "8", "332", "36", null, null, this);
            obj.set_taborder("14");
            obj.set_text("1.공통메세지호출");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "28", "276", "108", "36", null, null, this);
            obj.set_taborder("15");
            obj.set_text("alert");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "504", "276", "155", "36", null, null, this);
            obj.set_taborder("16");
            obj.set_text("confirm");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Button("btn_alert", "absolute", "30", "330", "184", "27", null, null, this);
            obj.set_taborder("17");
            obj.set_text("공통alert(default)");
            this.addChild(obj.name, obj);

            obj = new Button("btnAlert_error0", "absolute", "30", "394", "184", "27", null, null, this);
            obj.set_taborder("18");
            obj.set_text("공통alert(error)");
            this.addChild(obj.name, obj);

            obj = new Button("btnAlert_info", "absolute", "30", "426", "184", "27", null, null, this);
            obj.set_taborder("19");
            obj.set_text("공통alert(information)");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "260", "270", "108", "36", null, null, this);
            obj.set_taborder("20");
            obj.set_text("alert");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Button("btn_alert00", "absolute", "244", "325", "184", "27", null, null, this);
            obj.set_taborder("21");
            obj.set_text("기본제공alert(default)");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "771", "276", "155", "36", null, null, this);
            obj.set_taborder("22");
            obj.set_text("confirm");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Button("btn_alert01", "absolute", "760", "320", "184", "27", null, null, this);
            obj.set_taborder("23");
            obj.set_text("기본제공confirm(default)");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 641, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("SAMPL00068_탭이동시그리드값유지");
            		p.set_titletext("공통Message창호출");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample013.xfdl", "lib::comLib.xjs");
        this.registerScript("sample013.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : 
        * BUSINESS    : 
        * FILE NAME   : 
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        * 
        *------------------------------------------------------------------
        ***********************************************************************************/

        
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/
         

        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
             Ex.core.init(obj);
             this.setMsgSet();
        }

        this.setMsgSet  = function()
        {
            application.gds_message.assign(this.ds_message);
            trace(" application.gds_message : "  + application.gds_message.saveXML());
        }

        

        //메세지 콜벡 메세지 처리 화면단에 필수로 있어야함
        /**
        * 공통 팝업 open 함수
        * @param {string} callbackId
        * @param {string} OK  OR CANCEL
        * @return 
        * @example
        * @memberOf public
        */ 
        this.fn_callBackMsg = function(strCallBackId,strResult)
        {
           trace(" strCallBackId : "  +strCallBackId + " <> strResult : " + strResult);
           
             	if(strResult == "OK")
        		{
        		  if(strCallBackId == "confirm_1")
        		  {
        		      alert(" Confirm ok!!!!!");
        		  }
        		}
        		else if(strResult == "CANCEL")
        		{
        		    alert(" CANCEL");
        		}
        }

        this.btn_alert_onclick = function(obj,e)
        {
              var value = "필수";
         
                Ex.core.showMsg(this,"alert","_alert1","errors.required",value,"default");
              
        }

        //gfn_alert warning
        this.btnAlert_warning_onclick = function(obj,e)
        {
        	 
        	  var value = "필수";
        	      Ex.core.showMsg(this,"alert","_alert1","errors.required",value,"warning");
        	 
        	 //@param ,메세지ID 
        	//@param 메세지코드
        	//@param ,타입
        	//this.gfn_alert("msgID_2","common.date.input","","warning");
        }
        this.btnAlert_error0_onclick = function(obj,e)
        {
        	var value = "필수";
        	    Ex.core.showMsg(this,"alert","_alert1","errors.required",value,"error");
        }

        this.btnAlert_info_onclick = function(obj,e)
        {
        	var value = "필수";
        	    Ex.core.showMsg(this,"alert","_alert1","errors.required",value,"information");
        }

        this.btnAlert_informationMiddle_onclick = function(obj,e)
        {
        	var value = "필수";
        	    Ex.core.showMsg(this,"alert","_alert1","errors.required",value,"information","this.fn_callBackMsg","middle");
        }

        this.btnAlert_max_onclick = function(obj,e)
        {
        	var value = "필수";
        	    Ex.core.showMsg(this,"alert","_alert1","errors.required",value,"information","max","this.fn_callBackMsg");
        }

        this.btnConfirm_default_onclick = function(obj,e)
        {
        	var value = "필수";
        	    Ex.core.showMsg(this,"confirm","_confirm","errors.required",value,"information","max","this.fn_callBackMsg");
        }

        this.btn_alert00_onclick = function(obj,e)
        {
        	var value = "aaaaaaaaaaaaaaa";
               Ex.core.comMsg("alert","errors.required","valiValue_empty","default",value);
        }

        this.btn_alert01_onclick = function(obj,e)
        {
        	var value = "aaaaaaaaaaaaaaa";
              if( Ex.core.comMsg("confirm","errors.required","valiValue_empty","default",value))
                alert(" ok");
              else
                 alert(" cancel");
              
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btnAlert_warning.addEventHandler("onclick", this.btnAlert_warning_onclick, this);
            this.btnAlert_informationMiddle.addEventHandler("onclick", this.btnAlert_informationMiddle_onclick, this);
            this.btnAlert_max.addEventHandler("onclick", this.btnAlert_max_onclick, this);
            this.btnConfirm_default.addEventHandler("onclick", this.btnConfirm_default_onclick, this);
            this.btn_alert.addEventHandler("onclick", this.btn_alert_onclick, this);
            this.btnAlert_error0.addEventHandler("onclick", this.btnAlert_error0_onclick, this);
            this.btnAlert_info.addEventHandler("onclick", this.btnAlert_info_onclick, this);
            this.btn_alert00.addEventHandler("onclick", this.btn_alert00_onclick, this);
            this.btn_alert01.addEventHandler("onclick", this.btn_alert01_onclick, this);

        };

        this.loadIncludeScript("sample013.xfdl");

       
    };
}
)();
