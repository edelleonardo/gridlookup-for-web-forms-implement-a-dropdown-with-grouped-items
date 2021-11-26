﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiColumn.aspx.cs" Inherits="DXWebApplication1.MultiColumn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style>
        .groupRow {
            font-weight: bold;
            color: black;
            background-color: lightgreen;
        }
/*
        .dataRow td.dxgvIndentCell {
            display: none;
        }*/
    </style>
    <script>
        var timeout = 0;
        function OnKeyPress(s, e) {
            s.ShowDropDown();

            if (timeout) {
                clearTimeout(timeout);
            }


            timeout = setTimeout(function () {
                var filter = s.GetInputElement().value;
                s.GetGridView().ApplySearchPanelFilter(filter)
            }, 500);

        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
         <dx:ASPxGridLookup ID="gridLookup" runat="server" KeyFieldName="ContactId" 
             Width="300px" ClientInstanceName="gridLookup" TextFormatString="{1}" 
             OnInit="gridLookup_Init" IncrementalFilteringMode="None"
             >
            <ClientSideEvents KeyUp="OnKeyPress" />
           <GridViewProperties>
         
               <Settings GridLines="None" />
               <SettingsBehavior EnableRowHotTrack="true" />
                <Settings ShowColumnHeaders="true"  GroupFormat="{1}" />
                <SettingsBehavior AutoExpandAllGroups="true" />
                <SettingsPager Mode="ShowAllRecords" />
           </GridViewProperties>
            <Columns>
                <dx:GridViewDataColumn FieldName="ContactId"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="ContactName"/>
                <dx:GridViewDataColumn FieldName="Region" GroupIndex="0"  />
            </Columns>
            <GridViewStyles>
                <GroupRow CssClass="groupRow" />
                <Row CssClass="dataRow" />
            </GridViewStyles>
        </dx:ASPxGridLookup>

    </form>
</body>
</html>