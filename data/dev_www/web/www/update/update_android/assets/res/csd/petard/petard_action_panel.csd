<GameFile>
  <PropertyGroup Name="petard_action_panel" Type="Layer" ID="bdurvpe8joi0fayzc1l9nqst3whm45gkx7-6" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="848.000000" />
        <Children>
          <AbstractNodeData Name="main_container" ActionTag="1413956894" Tag="75" RotationSkewX="0" RotationSkewY="0" LeftMargin="0.0001" RightMargin="-0.0001" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="848" X="720" />
            <AnchorPoint ScaleX="0" ScaleY="0" />
            <Position X="0.0001" Y="0" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="image_bg" ActionTag="-1690062260" Tag="76" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="16" Scale9Height="16" ctype="ImageViewObjectData">
                <Size Y="848" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="424" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="item_num_bg_1" ActionTag="1682131124" Tag="77" RotationSkewX="0" RotationSkewY="0" LeftMargin="444" RightMargin="74" TopMargin="352.999908" BottomMargin="463.000092" LeftEage="1" RightEage="1" TopEage="10" BottomEage="10" Scale9OriginX="1" Scale9OriginY="10" Scale9Width="3" Scale9Height="12" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="32" X="202" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="545" Y="479.000092" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="actionpetard_1005.png" Plist="resource/actionpetard/actionpetard.plist" />
                <Children>
                  <AbstractNodeData Name="item_icon" ActionTag="1005754829" Tag="78" RotationSkewX="0" RotationSkewY="0" LeftMargin="-32.5" RightMargin="129.5" TopMargin="-36.5" BottomMargin="-36.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="105" X="105" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="20" Y="16" />
                    <Scale ScaleX="0.4" ScaleY="0.4" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Normal" Path="resource/item/37003.png" Plist="" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="item_num_txt" ActionTag="-942157163" Tag="79" RotationSkewX="0" RotationSkewY="0" LeftMargin="73" RightMargin="73" TopMargin="2" BottomMargin="2" FontSize="22" LabelText="9999" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="28" X="56" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="101" Y="16" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="66" G="185" R="241" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="50" G="11" R="35" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="add_item_btn" ActionTag="226330554" Tag="80" RotationSkewX="0" RotationSkewY="0" LeftMargin="179" RightMargin="-19" TopMargin="-5" BottomMargin="-5" TouchEnable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="12" Scale9Height="20" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="40" ctype="ButtonObjectData">
                    <Size Y="42" X="42" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="200" Y="16" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <NormalFileData Type="PlistSubImage" Path="common_1015.png" Plist="resource/common/common.plist" />
                    <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                    <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                    <TextColor A="255" B="255" G="255" R="255" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="item_num_bg_2" ActionTag="-1465019523" Tag="81" RotationSkewX="0" RotationSkewY="0" LeftMargin="444" RightMargin="74" TopMargin="402" BottomMargin="414" LeftEage="1" RightEage="1" TopEage="10" BottomEage="10" Scale9OriginX="1" Scale9OriginY="10" Scale9Width="3" Scale9Height="12" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="32" X="202" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="545" Y="430" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="actionpetard_1005.png" Plist="resource/actionpetard/actionpetard.plist" />
                <Children>
                  <AbstractNodeData Name="item_icon" ActionTag="-714884560" Tag="82" RotationSkewX="0" RotationSkewY="0" LeftMargin="-32.5" RightMargin="129.5" TopMargin="-36.5" BottomMargin="-36.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="105" X="105" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="20" Y="16" />
                    <Scale ScaleX="0.4" ScaleY="0.4" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Normal" Path="resource/item/37003.png" Plist="" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="item_num_txt" ActionTag="-1043107749" Tag="83" RotationSkewX="0" RotationSkewY="0" LeftMargin="73" RightMargin="73" TopMargin="2" BottomMargin="2" FontSize="22" LabelText="9999" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="28" X="56" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="101" Y="16" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="66" G="185" R="241" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="50" G="11" R="35" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="add_item_btn" ActionTag="1650691700" Tag="84" RotationSkewX="0" RotationSkewY="0" LeftMargin="179" RightMargin="-19" TopMargin="-5" BottomMargin="-5" TouchEnable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="12" Scale9Height="20" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="40" ctype="ButtonObjectData">
                    <Size Y="42" X="42" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="200" Y="16" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <NormalFileData Type="PlistSubImage" Path="common_1015.png" Plist="resource/common/common.plist" />
                    <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                    <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                    <TextColor A="255" B="255" G="255" R="255" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="shop_btn" ActionTag="-1126213034" Tag="85" RotationSkewX="0" RotationSkewY="0" LeftMargin="565.499817" RightMargin="79.500198" TopMargin="17.5" BottomMargin="755.5" TouchEnable="True" LeftEage="24" RightEage="24" TopEage="24" BottomEage="24" Scale9OriginX="24" Scale9OriginY="24" Scale9Width="27" Scale9Height="27" ctype="ImageViewObjectData">
                <Size Y="75" X="75" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="602.999817" Y="793" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_90083.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="1878658515" Tag="86" RotationSkewX="0" RotationSkewY="0" LeftMargin="-3.8625" RightMargin="-5.1375" TopMargin="57.749699" BottomMargin="-8.7497" FontSize="20" LabelText="兑换商店" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="84" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="38.137501" Y="4.2503" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="244" R="252" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="10" G="13" R="33" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="put_btn" ActionTag="1703493432" Tag="87" RotationSkewX="0" RotationSkewY="0" LeftMargin="257.5" RightMargin="257.5" TopMargin="771.5" BottomMargin="15.5" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="27" BottomEage="27" Scale9OriginX="17" Scale9OriginY="27" Scale9Width="30" Scale9Height="9" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="61" X="205" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="46" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="862418453" Tag="88" RotationSkewX="0" RotationSkewY="0" LeftMargin="48" RightMargin="48" TopMargin="14.5" BottomMargin="14.5" FontSize="26" LabelText="燃放烟花" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="32" X="109" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="102.5" Y="30.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="25" G="69" R="118" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="btn_rule" ActionTag="1847066184" Tag="89" RotationSkewX="0" RotationSkewY="0" LeftMargin="651.999512" RightMargin="10.0005" TopMargin="26" BottomMargin="764" TouchEnable="True" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="28" Scale9Height="36" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="58" X="58" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="680.999512" Y="793" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="common_1061.png" Plist="resource/common/common.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="progress" ActionTag="-1318570405" Tag="67" RotationSkewX="0" RotationSkewY="0" LeftMargin="9" RightMargin="9" TopMargin="586" BottomMargin="251" ProgressInfo="100" ctype="LoadingBarObjectData">
                <Size Y="11" X="702" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="9" Y="256.5" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <ImageFileData Type="PlistSubImage" Path="actionpetard_1004.png" Plist="resource/actionpetard/actionpetard.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="time_txt" ActionTag="1415033685" Tag="91" RotationSkewX="0" RotationSkewY="0" LeftMargin="407" RightMargin="37" TopMargin="242" BottomMargin="578" FontSize="22" LabelText="活动时间: 10月1日-10月7日" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="276" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="545" Y="592" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="66" G="185" R="241" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="50" G="11" R="35" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="item_num_title" ActionTag="147920633" Tag="92" RotationSkewX="0" RotationSkewY="0" LeftMargin="441" RightMargin="181" TopMargin="317" BottomMargin="503" FontSize="22" LabelText="当前拥有: " OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="98" />
                <AnchorPoint ScaleX="1" ScaleY="0.5" />
                <Position X="539" Y="517" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="50" G="11" R="35" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="action_tips" ActionTag="1106340953" Tag="59" RotationSkewX="0" RotationSkewY="0" LeftMargin="399.5" RightMargin="29.5" TopMargin="208" BottomMargin="612" FontSize="22" LabelText="秋日祭，放烟花，花火兑好礼" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="291" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="545" Y="626" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="244" R="252" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="10" G="13" R="33" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="petard_hot_txt" ActionTag="1248973106" Tag="60" RotationSkewX="0" RotationSkewY="0" LeftMargin="42.000198" RightMargin="445.999786" TopMargin="508.004303" BottomMargin="311.995697" FontSize="22" LabelText="全服烟花热度：0/1000" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="232" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="42.000198" Y="325.995697" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="50" G="11" R="35" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="lantern_panel" ActionTag="318672878" Tag="68" RotationSkewX="0" RotationSkewY="0" LeftMargin="1.7642" RightMargin="-1.7642" TopMargin="584" BottomMargin="80" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="184" X="720" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="1.7642" Y="80" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
              <AbstractNodeData Name="hot_val_image" ActionTag="-525200422" Tag="69" RotationSkewX="0" RotationSkewY="0" LeftMargin="50.5" RightMargin="604.5" TopMargin="552.5" BottomMargin="252.5" LeftEage="21" RightEage="21" TopEage="14" BottomEage="14" Scale9OriginX="21" Scale9OriginY="14" Scale9Width="23" Scale9Height="15" ctype="ImageViewObjectData">
                <Size Y="43" X="65" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="83" Y="274" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="actionpetard_1006.png" Plist="resource/actionpetard/actionpetard.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="1318161497" Tag="70" RotationSkewX="0" RotationSkewY="0" LeftMargin="10" RightMargin="10" TopMargin="2.5" BottomMargin="17.5" FontSize="18" LabelText="1000" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="23" X="45" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="32.5" Y="29" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="244" R="252" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="14" G="39" R="93" />
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
