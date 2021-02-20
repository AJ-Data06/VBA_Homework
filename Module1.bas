Attribute VB_Name = "Module1"
Sub stock_market_analysis()

For Each ws In ThisWorkbook.Worksheets
ws.Activate


Dim ticker_name As String
Dim stock_volume As Double
Dim yearly_change As Double
Dim opening_price As Double
Dim closing_price As Double
Dim percentage_change As Double

Dim summary_table As Integer
 summary_table = 2
 
Dim last_row As Double
  last_row = ws.Cells(Rows.Count, 1).End(xlUp).Row
  
stock_volume = 0
closing_price = 0

Range("I1") = "ticker_name"
Range("J1") = "opening_price"
Range("K1") = "closing_price"
Range("N1") = "stock_volume"
Range("L1") = "price_change"
Range("M1") = "percentage_change"

opening_price = Cells(2, 3).Value

For i = 2 To last_row

If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
   ticker_name = Cells(i, 1).Value
   stock_volume = stock_volume + Cells(i, 7).Value
   closing_price = Cells(i, 6).Value
   price_change = (closing_price - opening_price)
   
   If opening_price = 0 Then
        percentage_change = 0
        Else
        percentage_change = Round((price_change / opening_price) * 1, [2])

        End If
 
 opening_price = Cells(i + 1, 6).Value
  ' change the value
  
Range("I" & summary_table) = ticker_name
Range("N" & summary_table) = stock_volume
Range("L" & summary_table) = price_change
Range("M" & summary_table) = percentage_change
Range("J" & summary_table) = opening_price
Range("K" & summary_table) = closing_price

   
    If price_change > 0 Then
       Range("L" & summary_table).Interior.Color = vbGreen
       ElseIf price_change < 0 Then
       Range("L" & summary_table).Interior.Color = vbRed
        End If
        
        
summary_table = summary_table + 1

stock_volume = stock_volume + 1

Else

stock_volume = stock_volume + Cells(i, 7).Value

End If

Next i

 Range("I1") = "ticker_name"
 Range("M1") = "percentage_change"
 Range("N1") = "stock_volume"
 Range("L1") = "price_change"
 Range("J1") = "opening_price"
 Range("K1") = "closing_price"
 

Next ws



       
       
       
       
       

  
 
        
        
        
        
   

 
 
End Sub


