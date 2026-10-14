<GameFile>
  <PropertyGroup Name="hallows_task_window" Type="Layer" ID="gb10eku2d9yicnjqpaw4t3o-l76m5fsrxzh8" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-564934372" Tag="311" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="16" Scale9Height="16" ctype="ImageViewObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_panel" ActionTag="-1739045033" Tag="258" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" Scale9Enable="True" LeftEage="-13" RightEage="-13" TopEage="-20" BottomEage="-20" Scale9OriginX="-13" Scale9OriginY="-20" Scale9Width="26" Scale9Height="34" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
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
              <AbstractNodeData Name="title_bg" ActionTag="-1518296315" Tag="177" RotationSkewX="0" RotationSkewY="0" LeftMargin="165" RightMargin="165" TopMargin="64" BottomMargin="1114" LeftEage="7" RightEage="7" TopEage="15" BottomEage="15" Scale9OriginX="7" Scale9OriginY="15" Scale9Width="376" Scale9Height="72" ctype="ImageViewObjectData">
                <Size Y="102" X="390" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="1165" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="hallows_1020.png" Plist="resource/hallows/hallows.plist" />
                <Children>
                  <AbstractNodeData Name="hallows_name" ActionTag="-925303404" Tag="178" RotationSkewX="0" RotationSkewY="0" LeftMargin="116.5" RightMargin="116.5" TopMargin="34" BottomMargin="34" FontSize="26" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="34" X="157" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="195" Y="51" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="161" G="227" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="bottom_bg" ActionTag="2093784176" Tag="175" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="754" BottomMargin="128" LeftEage="32" RightEage="32" TopEage="34" BottomEage="34" Scale9OriginX="32" Scale9OriginY="34" Scale9Width="19" Scale9Height="25" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="398" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="360" Y="128" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="hallows_1001.png" Plist="resource/hallows/hallows.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="explain_btn" ActionTag="1965787980" Tag="174" RotationSkewX="0" RotationSkewY="0" LeftMargin="586" RightMargin="76" TopMargin="86" BottomMargin="1136" TouchEnable="True" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="28" Scale9Height="36" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="58" X="58" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="615" Y="1165" />
                <Scale ScaleX="0.8" ScaleY="0.8" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="common_1061.png" Plist="resource/common/common.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="skill_bg" ActionTag="-1540536584" Tag="179" RotationSkewX="0" RotationSkewY="0" LeftMargin="7" RightMargin="7" TopMargin="599.5" BottomMargin="539.5" LeftEage="16" RightEage="16" TopEage="14" BottomEage="14" Scale9OriginX="16" Scale9OriginY="14" Scale9Width="17" Scale9Height="15" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="141" X="706" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="610" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1092.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="progress_container" ActionTag="1494988375" Tag="333" RotationSkewX="0" RotationSkewY="0" LeftMargin="234" RightMargin="124" TopMargin="786.5" BottomMargin="472.5" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="21" X="362" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="234" Y="483" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="Image_1" ActionTag="1486804891" Tag="334" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="9" RightEage="9" TopEage="7" BottomEage="7" Scale9OriginX="9" Scale9OriginY="7" Scale9Width="2" Scale9Height="3" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="21" X="362" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="0" Y="10.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_90005.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="progress" ActionTag="-739305550" Tag="335" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="1" BottomMargin="1" ProgressInfo="100" ctype="LoadingBarObjectData">
                    <Size Y="19" X="362" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="0" Y="10.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <ImageFileData Type="PlistSubImage" Path="common_90006.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="value" ActionTag="-815656385" Tag="336" RotationSkewX="0" RotationSkewY="0" LeftMargin="165" RightMargin="165" TopMargin="-2.0008" BottomMargin="-2.9992" FontSize="20" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="32" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="181" Y="10.0008" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="194" G="238" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="title" ActionTag="-1379344193" Tag="284" RotationSkewX="0" RotationSkewY="0" LeftMargin="-118" RightMargin="380" TopMargin="-5" BottomMargin="-5" FontSize="24" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="31" X="100" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="-68" Y="10.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="35" G="50" R="100" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="8" G="37" R="87" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="task_panel" ActionTag="1996448118" Tag="114" RotationSkewX="0" RotationSkewY="0" LeftMargin="20" RightMargin="20" TopMargin="845" BottomMargin="150" BackColorAlpha="102" Scale9Enable="True" LeftEage="5" RightEage="5" TopEage="5" BottomEage="5" Scale9OriginX="5" Scale9OriginY="5" Scale9Width="6" Scale9Height="7" ctype="PanelObjectData">
                <Size Y="285" X="680" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="360" Y="150" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="hallows_1023.png" Plist="resource/hallows/hallows.plist" />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="list_view" ActionTag="906822776" Tag="337" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="285" X="680" />
                    <AnchorPoint ScaleX="0" ScaleY="0" />
                    <Position X="0" Y="0" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="attr_panel" ActionTag="-1188544756" Tag="173" RotationSkewX="0" RotationSkewY="0" LeftMargin="15" RightMargin="15" TopMargin="834" BottomMargin="146" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="300" X="690" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="360" Y="146" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="bottom_bg_2" ActionTag="588233678" Tag="181" RotationSkewX="0" RotationSkewY="0" LeftMargin="-0.5" RightMargin="-0.5" TopMargin="4" BottomMargin="-4" LeftEage="15" RightEage="15" TopEage="21" BottomEage="21" Scale9OriginX="15" Scale9OriginY="21" Scale9Width="47" Scale9Height="32" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="300" X="691" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="345" Y="146" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_2007.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="attr_bg_2" ActionTag="-1626551995" Tag="182" RotationSkewX="0" RotationSkewY="0" LeftMargin="355.5" RightMargin="45.5" TopMargin="30.5" BottomMargin="230.5" LeftEage="5" RightEage="5" TopEage="5" BottomEage="5" Scale9OriginX="5" Scale9OriginY="5" Scale9Width="8" Scale9Height="6" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="39" X="289" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="500" Y="250" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hallows_1007.png" Plist="resource/hallows/hallows.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="attr_bg_1" ActionTag="569173279" Tag="183" RotationSkewX="0" RotationSkewY="0" LeftMargin="45.5" RightMargin="355.5" TopMargin="30.5" BottomMargin="230.5" LeftEage="5" RightEage="5" TopEage="5" BottomEage="5" Scale9OriginX="5" Scale9OriginY="5" Scale9Width="8" Scale9Height="6" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="39" X="289" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="190" Y="250" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hallows_1007.png" Plist="resource/hallows/hallows.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="max_bg_l" ActionTag="-1975014659" Tag="185" RotationSkewX="0" RotationSkewY="0" LeftMargin="213.299896" RightMargin="344.700104" TopMargin="158.000107" BottomMargin="-14.0001" LeftEage="3" RightEage="3" TopEage="-5" BottomEage="-5" Scale9OriginX="3" Scale9OriginY="-5" Scale9Width="40" Scale9Height="56" ctype="ImageViewObjectData">
                    <Size Y="156" X="132" />
                    <AnchorPoint ScaleX="1" ScaleY="0.5" />
                    <Position X="345.299896" Y="63.999901" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="max_bg_r" ActionTag="-1949828574" Tag="186" FlipX="True" RotationSkewX="0" RotationSkewY="0" LeftMargin="213.000198" RightMargin="344.999786" TopMargin="158.000107" BottomMargin="-14.0001" LeftEage="3" RightEage="3" TopEage="-5" BottomEage="-5" Scale9OriginX="3" Scale9OriginY="-5" Scale9Width="40" Scale9Height="56" ctype="ImageViewObjectData">
                    <Size Y="156" X="132" />
                    <AnchorPoint ScaleX="1" ScaleY="0.5" />
                    <Position X="345.000214" Y="63.999901" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="desc_label" ActionTag="-180156703" Tag="283" RotationSkewX="0" RotationSkewY="0" LeftMargin="134.5" RightMargin="134.5" TopMargin="105.500198" BottomMargin="165.499802" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="29" X="421" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="345" Y="179.999802" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="42" G="69" R="104" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="go_battle_btn" ActionTag="-285598624" Tag="174" RotationSkewX="0" RotationSkewY="0" LeftMargin="264" RightMargin="264" TopMargin="190.999893" BottomMargin="45.000099" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="20" BottomEage="20" Scale9OriginX="17" Scale9OriginY="20" Scale9Width="30" Scale9Height="23" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="64" X="162" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="345" Y="77.000099" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1018.png" Plist="resource/common/common.plist" />
                    <Children>
                      <AbstractNodeData Name="label" ActionTag="-1309305376" Tag="175" RotationSkewX="0" RotationSkewY="0" LeftMargin="38.5" RightMargin="38.5" TopMargin="13" BottomMargin="13" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="38" X="85" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="81" Y="32" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="21" G="74" R="41" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="right_btn" ActionTag="652464914" Tag="127" RotationSkewX="0" RotationSkewY="0" LeftMargin="570" RightMargin="120" TopMargin="310" BottomMargin="906" TouchEnable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="1" Scale9Height="42" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="64" X="30" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="585" Y="938" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="hallows_1017.png" Plist="resource/hallows/hallows.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="left_btn" ActionTag="263860135" Tag="128" FlipX="True" RotationSkewX="0" RotationSkewY="0" LeftMargin="120" RightMargin="570" TopMargin="310" BottomMargin="906" TouchEnable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="1" Scale9Height="42" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="64" X="30" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="135" Y="938" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="hallows_1017.png" Plist="resource/hallows/hallows.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="artifact_btn" ActionTag="-1487135534" Tag="127" RotationSkewX="0" RotationSkewY="0" LeftMargin="440.999786" RightMargin="11.0002" TopMargin="512" BottomMargin="684" TouchEnable="True" LeftEage="50" RightEage="50" TopEage="25" BottomEage="25" Scale9OriginX="50" Scale9OriginY="25" Scale9Width="63" Scale9Height="34" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="84" X="268" />
                <AnchorPoint ScaleX="1" ScaleY="0.5" />
                <Position X="708.999817" Y="726" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="hallows_1004.png" Plist="resource/hallows/hallows.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="-77444977" Tag="128" RotationSkewX="0" RotationSkewY="0" LeftMargin="31.725599" RightMargin="77.725601" TopMargin="32.844799" BottomMargin="13.1552" FontSize="26" LabelText="---" IsCustomSize="True" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="38" X="158.548798" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="111" Y="32.155201" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Image_5" Visible="False" ActionTag="-1483655980" Tag="180" RotationSkewX="0" RotationSkewY="0" LeftMargin="16" RightMargin="214" TopMargin="22" BottomMargin="22" LeftEage="12" RightEage="12" TopEage="13" BottomEage="13" Scale9OriginX="12" Scale9OriginY="13" Scale9Width="22" Scale9Height="20" ctype="ImageViewObjectData">
                    <Size Y="40" X="38" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="35" Y="42" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="item" Visible="False" ActionTag="192789623" Tag="338" RotationSkewX="0" RotationSkewY="0" LeftMargin="-523.222229" RightMargin="906.222229" TopMargin="866.5" BottomMargin="274.5" TouchEnable="True" BackColorAlpha="102" Scale9Enable="True" LeftEage="29" RightEage="29" TopEage="26" BottomEage="26" Scale9OriginX="29" Scale9OriginY="26" Scale9Width="52" Scale9Height="43" ctype="PanelObjectData">
                <Size Y="139" X="337" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="-354.722198" Y="344" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="hallows_1028.png" Plist="resource/hallows/hallows.plist" />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="Image_4" ActionTag="410319980" Tag="683" RotationSkewX="0" RotationSkewY="0" LeftMargin="3.37" RightMargin="3.37" TopMargin="2.0881" BottomMargin="96.911903" Alpha="102" LeftEage="5" RightEage="5" TopEage="5" BottomEage="5" Scale9OriginX="5" Scale9OriginY="5" Scale9Width="8" Scale9Height="6" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="40" X="330.26001" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="168.5" Y="116.911903" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hallows_1007.png" Plist="resource/hallows/hallows.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="get_btn" ActionTag="779761671" Tag="354" RotationSkewX="0" RotationSkewY="0" LeftMargin="197.665207" RightMargin="38.334801" TopMargin="56" BottomMargin="29" TouchEnable="True" LeftEage="11" RightEage="11" TopEage="20" BottomEage="20" Scale9OriginX="11" Scale9OriginY="20" Scale9Width="84" Scale9Height="13" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="54" X="101" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="248.165207" Y="56" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1027.png" Plist="resource/common/common.plist" />
                    <Children>
                      <AbstractNodeData Name="label" ActionTag="-345288901" Tag="355" RotationSkewX="0" RotationSkewY="0" LeftMargin="23" RightMargin="23" TopMargin="8" BottomMargin="8" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="38" X="55" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="50.5" Y="27" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="25" G="69" R="118" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="goto_btn" Visible="False" ActionTag="711983396" Tag="356" RotationSkewX="0" RotationSkewY="0" LeftMargin="198.499603" RightMargin="37.500401" TopMargin="56.000099" BottomMargin="28.999901" TouchEnable="True" LeftEage="11" RightEage="11" TopEage="20" BottomEage="20" Scale9OriginX="11" Scale9OriginY="20" Scale9Width="84" Scale9Height="13" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="54" X="101" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="248.999603" Y="55.999901" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1027.png" Plist="resource/common/common.plist" />
                    <Children>
                      <AbstractNodeData Name="label" ActionTag="-1076866677" Tag="357" RotationSkewX="0" RotationSkewY="0" LeftMargin="22.5" RightMargin="22.5" TopMargin="8" BottomMargin="8" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="38" X="56" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="50.5" Y="27" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="25" G="69" R="118" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="finish_icon" ActionTag="-2095562279" Tag="359" RotationSkewX="0" RotationSkewY="0" LeftMargin="210.499405" RightMargin="49.500599" TopMargin="44.5" BottomMargin="17.5" LeftEage="25" RightEage="25" TopEage="25" BottomEage="25" Scale9OriginX="25" Scale9OriginY="25" Scale9Width="27" Scale9Height="27" ctype="ImageViewObjectData">
                    <Size Y="77" X="77" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="248.999405" Y="56" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1000.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="touch_layout" ActionTag="1062515383" Tag="157" RotationSkewX="0" RotationSkewY="0" LeftMargin="210" RightMargin="210" TopMargin="125" BottomMargin="825" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="330" X="300" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="360" Y="825" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
