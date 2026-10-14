<GameFile>
  <PropertyGroup Name="elfin_privilege_window" Type="Layer" ID="9hfovrlw04qnb8pkg2ziux3sec75jatymd1-" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-2136127312" Tag="57" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="148" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
          </AbstractNodeData>
          <AbstractNodeData Name="container" ActionTag="-1411969787" Tag="58" RotationSkewX="0" RotationSkewY="0" LeftMargin="59.5" RightMargin="59.5" TopMargin="350.5" BottomMargin="350.5" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="579" X="601" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="image_bg" ActionTag="1081328671" Tag="60" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="198" RightEage="198" TopEage="191" BottomEage="191" Scale9OriginX="198" Scale9OriginY="191" Scale9Width="205" Scale9Height="197" ctype="ImageViewObjectData">
                <Size Y="579" X="601" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="300.5" Y="289.5" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Normal" Path="resource/elfin/txt_cn_privilege_bg.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="go_to_btn" ActionTag="-274939675" Tag="73" RotationSkewX="0" RotationSkewY="0" LeftMargin="219.5" RightMargin="219.5" TopMargin="457" BottomMargin="58" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="20" BottomEage="20" Scale9OriginX="17" Scale9OriginY="20" Scale9Width="30" Scale9Height="23" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="64" X="162" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="300.5" Y="90" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="625090489" Tag="74" RotationSkewX="0" RotationSkewY="0" LeftMargin="65" RightMargin="65" TopMargin="13" BottomMargin="13" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="38" X="32" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="81" Y="32" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="25" G="69" R="118" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="btn_close" ActionTag="841226007" Tag="92" RotationSkewX="0" RotationSkewY="0" LeftMargin="487.000214" RightMargin="43.999802" TopMargin="67.999901" BottomMargin="449.000092" TouchEnable="True" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="40" Scale9Height="40" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="62" X="70" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="522.000183" Y="480.000092" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="common_1028.png" Plist="resource/common/common.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="sp_icon_k_1" ActionTag="-1621773761" Tag="61" RotationSkewX="0" RotationSkewY="0" LeftMargin="77" RightMargin="442" TopMargin="163" BottomMargin="334" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="82" X="82" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="118" Y="375" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="elfin_1014.png" Plist="resource/elfin/elfin.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="sp_icon_1" ActionTag="458448979" Tag="64" RotationSkewX="0" RotationSkewY="0" LeftMargin="29" RightMargin="394" TopMargin="151" BottomMargin="322" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="106" X="178" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="118" Y="375" />
                <Scale ScaleX="0.4" ScaleY="0.4" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="elfin_1046.png" Plist="resource/elfin/elfin.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="sp_icon_k_2" ActionTag="-1288621320" Tag="62" RotationSkewX="0" RotationSkewY="0" LeftMargin="77" RightMargin="442" TopMargin="253" BottomMargin="244" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="82" X="82" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="118" Y="285" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="elfin_1014.png" Plist="resource/elfin/elfin.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="sp_icon_2" ActionTag="-1514305338" Tag="65" RotationSkewX="0" RotationSkewY="0" LeftMargin="65.5" RightMargin="430.5" TopMargin="241.5" BottomMargin="232.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="105" X="105" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="118" Y="285" />
                <Scale ScaleX="0.7" ScaleY="0.7" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Normal" Path="resource/item/10603.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="sp_icon_k_3" ActionTag="-1355524485" Tag="63" RotationSkewX="0" RotationSkewY="0" LeftMargin="77" RightMargin="442" TopMargin="343" BottomMargin="154" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="82" X="82" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="118" Y="195" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="elfin_1014.png" Plist="resource/elfin/elfin.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="sp_icon_3" ActionTag="1529873505" Tag="66" RotationSkewX="0" RotationSkewY="0" LeftMargin="65.5" RightMargin="430.5" TopMargin="331.5" BottomMargin="142.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="105" X="105" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="118" Y="195" />
                <Scale ScaleX="0.6" ScaleY="0.6" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Normal" Path="resource/item/10601.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="txt_bg_1" ActionTag="-256751168" Tag="67" RotationSkewX="0" RotationSkewY="0" LeftMargin="160.5" RightMargin="91.5" TopMargin="183" BottomMargin="354" LeftEage="15" RightEage="15" TopEage="20" BottomEage="20" Scale9OriginX="15" Scale9OriginY="20" Scale9Width="6" Scale9Height="2" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="42" X="349" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="335" Y="375" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="elfin_1015.png" Plist="resource/elfin/elfin.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="txt_bg_2" ActionTag="-27857410" Tag="68" RotationSkewX="0" RotationSkewY="0" LeftMargin="160.5" RightMargin="91.5" TopMargin="273" BottomMargin="264" LeftEage="15" RightEage="15" TopEage="20" BottomEage="20" Scale9OriginX="15" Scale9OriginY="20" Scale9Width="6" Scale9Height="2" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="42" X="349" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="335" Y="285" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="elfin_1015.png" Plist="resource/elfin/elfin.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="txt_bg_3" ActionTag="-107729538" Tag="69" RotationSkewX="0" RotationSkewY="0" LeftMargin="161.149506" RightMargin="90.850502" TopMargin="363.000092" BottomMargin="173.999893" LeftEage="15" RightEage="15" TopEage="20" BottomEage="20" Scale9OriginX="15" Scale9OriginY="20" Scale9Width="6" Scale9Height="2" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="42" X="349" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="335.649506" Y="194.999893" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="elfin_1015.png" Plist="resource/elfin/elfin.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="txt_tips_1" ActionTag="1340268773" Tag="70" RotationSkewX="0" RotationSkewY="0" LeftMargin="185" RightMargin="394" TopMargin="189.5" BottomMargin="360.5" FontSize="22" LabelText="---" IsCustomSize="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="29" X="22" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="185" Y="375" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="4" G="40" R="113" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="20" G="90" R="196" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="txt_tips_2" ActionTag="-1650921874" Tag="71" RotationSkewX="0" RotationSkewY="0" LeftMargin="185" RightMargin="394" TopMargin="279.5" BottomMargin="270.5" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="29" X="22" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="185" Y="285" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="4" G="40" R="113" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="20" G="90" R="196" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="txt_tips_3" ActionTag="-762474908" Tag="72" RotationSkewX="0" RotationSkewY="0" LeftMargin="185" RightMargin="394" TopMargin="369.5" BottomMargin="180.5" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="29" X="22" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="185" Y="195" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="4" G="40" R="113" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="20" G="90" R="196" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
