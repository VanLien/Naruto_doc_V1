<GameFile>
  <PropertyGroup Name="recruit_hero_window" Type="Layer" ID="0ztjcuhs6-9xe2gy58rwpdb43kanq1vof7lm" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-608403875" Tag="2" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="178" LeftEage="-237" RightEage="-237" TopEage="-422" BottomEage="-422" Scale9OriginX="-237" Scale9OriginY="-422" Scale9Width="474" Scale9Height="844" ctype="PanelObjectData">
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
          <AbstractNodeData Name="main_container" ActionTag="1846579531" Tag="3" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="173" BottomMargin="173" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="934" X="720" />
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
              <AbstractNodeData Name="load_bg" ActionTag="1168266704" Tag="91" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="934" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="467" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Normal" Path="resource/bigbg/action/action_bigbg_3.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_close" ActionTag="1573628161" Tag="4" RotationSkewX="0" RotationSkewY="0" LeftMargin="598.5" RightMargin="66.5" TopMargin="30.5" BottomMargin="848.5" TouchEnable="True" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="25" Scale9Height="33" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="55" X="55" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="626" Y="876" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="recruithero_1.png" Plist="resource/recruithero/recruithero.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="battle_preview_btn" ActionTag="-536274957" Tag="277" RotationSkewX="0" RotationSkewY="0" LeftMargin="131.003006" RightMargin="518.997009" TopMargin="142.001602" BottomMargin="721.998413" TouchEnable="True" LeftEage="24" RightEage="24" TopEage="24" BottomEage="24" Scale9OriginX="24" Scale9OriginY="24" Scale9Width="22" Scale9Height="22" ctype="ImageViewObjectData">
                <Size Y="70" X="70" />
                <AnchorPoint ScaleX="0.5038" ScaleY="0.617" />
                <Position X="166.268997" Y="765.188416" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="recruithero_6.png" Plist="resource/recruithero/recruithero.plist" />
                <Children>
                  <AbstractNodeData Name="preview_btn_label" ActionTag="1636846173" Tag="278" RotationSkewX="0" RotationSkewY="0" LeftMargin="-7" RightMargin="-7" TopMargin="67" BottomMargin="-23" FontSize="20" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="84" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="35" Y="-10" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="190" G="231" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="19" G="35" R="72" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="Text_1" ActionTag="-1192714552" Tag="5" RotationSkewX="0" RotationSkewY="0" LeftMargin="250" RightMargin="371" TopMargin="939" BottomMargin="-29" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="24" X="99" />
                <AnchorPoint ScaleX="1" ScaleY="0.5" />
                <Position X="349" Y="-17" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="191" G="248" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="remain_time" ActionTag="1597156005" Tag="6" RotationSkewX="0" RotationSkewY="0" LeftMargin="353" RightMargin="185" TopMargin="939" BottomMargin="-29" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="24" X="182" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="353" Y="-17" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="50" G="255" R="20" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Text_3" ActionTag="207149687" Tag="7" RotationSkewX="0" RotationSkewY="0" LeftMargin="123.5" RightMargin="123.5" TopMargin="972" BottomMargin="-64" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="473" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="-51" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="191" G="248" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="item_1" ActionTag="-964708138" Tag="51" RotationSkewX="0" RotationSkewY="0" LeftMargin="57" RightMargin="463" TopMargin="665" BottomMargin="19" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="250" X="200" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="157" Y="144" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="title" ActionTag="2087729323" Tag="52" RotationSkewX="0" RotationSkewY="0" LeftMargin="100" RightMargin="100" TopMargin="60" BottomMargin="190" FontSize="20" LabelText="" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="0" X="0" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="190" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="191" G="248" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_goto" ActionTag="1190129458" Tag="53" RotationSkewX="0" RotationSkewY="0" LeftMargin="35" RightMargin="35" TopMargin="193.5" BottomMargin="9.5" TouchEnable="True" LeftEage="21" RightEage="21" TopEage="20" BottomEage="20" Scale9OriginX="21" Scale9OriginY="20" Scale9Width="70" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="47" X="130" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="33" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="recruithero_4.png" Plist="resource/recruithero/recruithero.plist" />
                    <Children>
                      <AbstractNodeData Name="label" ActionTag="67523979" Tag="54" RotationSkewX="0" RotationSkewY="0" LeftMargin="16" RightMargin="16" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="26" X="98" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="65" Y="23.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="4" G="40" R="113" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="25" G="69" R="118" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_get" ActionTag="2002909975" Tag="55" RotationSkewX="0" RotationSkewY="0" LeftMargin="35" RightMargin="35" TopMargin="193.5" BottomMargin="9.5" TouchEnable="True" LeftEage="21" RightEage="21" TopEage="20" BottomEage="20" Scale9OriginX="21" Scale9OriginY="20" Scale9Width="70" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="47" X="130" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="33" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="recruithero_3.png" Plist="resource/recruithero/recruithero.plist" />
                    <Children>
                      <AbstractNodeData Name="label" ActionTag="-779650270" Tag="56" RotationSkewX="0" RotationSkewY="0" LeftMargin="15.5" RightMargin="15.5" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="26" X="99" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="65" Y="23.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="5" G="85" R="37" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="21" G="74" R="41" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="has" ActionTag="-574996882" Tag="33" RotationSkewX="0" RotationSkewY="0" LeftMargin="70" RightMargin="70" TopMargin="186.5" BottomMargin="2.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="61" X="60" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="33" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="recruithero_2.png" Plist="resource/recruithero/recruithero.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="item_2" ActionTag="-574007441" Tag="57" RotationSkewX="0" RotationSkewY="0" LeftMargin="248" RightMargin="272" TopMargin="665" BottomMargin="19" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="250" X="200" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="348" Y="144" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="title" ActionTag="1947917051" Tag="58" RotationSkewX="0" RotationSkewY="0" LeftMargin="100" RightMargin="100" TopMargin="60" BottomMargin="190" FontSize="20" LabelText="" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="0" X="0" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="190" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="191" G="248" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_goto" ActionTag="156857870" Tag="59" RotationSkewX="0" RotationSkewY="0" LeftMargin="35" RightMargin="35" TopMargin="193.5" BottomMargin="9.5" TouchEnable="True" LeftEage="21" RightEage="21" TopEage="20" BottomEage="20" Scale9OriginX="21" Scale9OriginY="20" Scale9Width="70" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="47" X="130" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="33" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="recruithero_4.png" Plist="resource/recruithero/recruithero.plist" />
                    <Children>
                      <AbstractNodeData Name="label" ActionTag="-131727640" Tag="60" RotationSkewX="0" RotationSkewY="0" LeftMargin="16" RightMargin="16" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="26" X="98" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="65" Y="23.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="4" G="40" R="113" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="25" G="69" R="118" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_get" ActionTag="1109919505" Tag="61" RotationSkewX="0" RotationSkewY="0" LeftMargin="35" RightMargin="35" TopMargin="193.5" BottomMargin="9.5" TouchEnable="True" LeftEage="21" RightEage="21" TopEage="20" BottomEage="20" Scale9OriginX="21" Scale9OriginY="20" Scale9Width="70" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="47" X="130" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="33" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="recruithero_3.png" Plist="resource/recruithero/recruithero.plist" />
                    <Children>
                      <AbstractNodeData Name="label" ActionTag="-1510484583" Tag="62" RotationSkewX="0" RotationSkewY="0" LeftMargin="15.5" RightMargin="15.5" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="26" X="99" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="65" Y="23.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="5" G="85" R="37" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="21" G="74" R="41" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="has" ActionTag="820419450" Tag="34" RotationSkewX="0" RotationSkewY="0" LeftMargin="70" RightMargin="70" TopMargin="186.5" BottomMargin="2.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="61" X="60" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="33" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="recruithero_2.png" Plist="resource/recruithero/recruithero.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="item_3" ActionTag="174903006" Tag="63" RotationSkewX="0" RotationSkewY="0" LeftMargin="444" RightMargin="76" TopMargin="665" BottomMargin="19" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="250" X="200" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="544" Y="144" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="title" ActionTag="-1103494323" Tag="64" RotationSkewX="0" RotationSkewY="0" LeftMargin="100" RightMargin="100" TopMargin="60" BottomMargin="190" FontSize="20" LabelText="" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="0" X="0" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="190" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="191" G="248" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_goto" ActionTag="365062026" Tag="65" RotationSkewX="0" RotationSkewY="0" LeftMargin="35" RightMargin="35" TopMargin="193.5" BottomMargin="9.5" TouchEnable="True" LeftEage="21" RightEage="21" TopEage="20" BottomEage="20" Scale9OriginX="21" Scale9OriginY="20" Scale9Width="70" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="47" X="130" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="33" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="recruithero_4.png" Plist="resource/recruithero/recruithero.plist" />
                    <Children>
                      <AbstractNodeData Name="label" ActionTag="565877081" Tag="66" RotationSkewX="0" RotationSkewY="0" LeftMargin="16" RightMargin="16" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="26" X="98" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="65" Y="23.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="4" G="40" R="113" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="25" G="69" R="118" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_get" ActionTag="-1734829699" Tag="67" RotationSkewX="0" RotationSkewY="0" LeftMargin="35" RightMargin="35" TopMargin="193.5" BottomMargin="9.5" TouchEnable="True" LeftEage="21" RightEage="21" TopEage="20" BottomEage="20" Scale9OriginX="21" Scale9OriginY="20" Scale9Width="70" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="47" X="130" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="33" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="recruithero_3.png" Plist="resource/recruithero/recruithero.plist" />
                    <Children>
                      <AbstractNodeData Name="label" ActionTag="819930187" Tag="68" RotationSkewX="0" RotationSkewY="0" LeftMargin="15.5" RightMargin="15.5" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="26" X="99" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="65" Y="23.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="5" G="85" R="37" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="21" G="74" R="41" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="has" ActionTag="-121392462" Tag="32" RotationSkewX="0" RotationSkewY="0" LeftMargin="70" RightMargin="70" TopMargin="186.5" BottomMargin="2.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="61" X="60" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="100" Y="33" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="recruithero_2.png" Plist="resource/recruithero/recruithero.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="all_get" ActionTag="-1487195631" Tag="90" RotationSkewX="0" RotationSkewY="0" LeftMargin="283" RightMargin="307" TopMargin="568.5" BottomMargin="318.5" TouchEnable="True" LeftEage="21" RightEage="21" TopEage="20" BottomEage="20" Scale9OriginX="21" Scale9OriginY="20" Scale9Width="70" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="47" X="130" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="348" Y="342" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="recruithero_3.png" Plist="resource/recruithero/recruithero.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="1327126384" Tag="91" RotationSkewX="0" RotationSkewY="0" LeftMargin="15.5" RightMargin="15.5" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="99" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="65" Y="23.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="5" G="85" R="37" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="21" G="74" R="41" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="all_goto" ActionTag="-186249467" Tag="30" RotationSkewX="0" RotationSkewY="0" LeftMargin="283" RightMargin="307" TopMargin="568.5" BottomMargin="318.5" LeftEage="21" RightEage="21" TopEage="20" BottomEage="20" Scale9OriginX="21" Scale9OriginY="20" Scale9Width="70" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="47" X="130" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="348" Y="342" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="recruithero_4.png" Plist="resource/recruithero/recruithero.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="1141956047" Tag="31" RotationSkewX="0" RotationSkewY="0" LeftMargin="15.5" RightMargin="15.5" TopMargin="10.5" BottomMargin="10.5" FontSize="24" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="99" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="65" Y="23.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="4" G="40" R="113" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="21" G="74" R="41" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="finish_text" ActionTag="1571455597" Tag="34" RotationSkewX="0" RotationSkewY="0" LeftMargin="265.5" RightMargin="295.5" TopMargin="620" BottomMargin="286" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="159" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="345" Y="300" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="191" G="248" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="15" G="30" R="57" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_paint" ActionTag="-759184988" Tag="36" RotationSkewX="0" RotationSkewY="0" LeftMargin="482.5" RightMargin="94.5" TopMargin="606" BottomMargin="286" TouchEnable="True" LeftEage="15" RightEage="15" TopEage="13" BottomEage="13" Scale9OriginX="15" Scale9OriginY="13" Scale9Width="113" Scale9Height="16" ctype="ImageViewObjectData">
                <Size Y="42" X="143" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="554" Y="307" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="recruithero_5.png" Plist="resource/recruithero/recruithero.plist" />
                <Children>
                  <AbstractNodeData Name="Sprite_1" ActionTag="1093270960" Tag="37" RotationSkewX="0" RotationSkewY="0" LeftMargin="6.5" RightMargin="95.5" TopMargin="-2" BottomMargin="-2" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="46" X="41" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="27" Y="21" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1093.png" Plist="resource/common/common.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Text_2" ActionTag="1487239917" Tag="37" RotationSkewX="0" RotationSkewY="0" LeftMargin="44" RightMargin="7" TopMargin="4" BottomMargin="10" FontSize="22" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="28" X="92" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="90" Y="24" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="108" G="7" R="81" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
