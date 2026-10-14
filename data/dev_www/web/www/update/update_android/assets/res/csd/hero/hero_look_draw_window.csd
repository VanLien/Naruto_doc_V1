<GameFile>
  <PropertyGroup Name="hero_look_draw_window" Type="Layer" ID="41rnk8eyq6dsg7oi2wzfulathm95p0jbvx-c" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-902448189" Tag="360" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="16" Scale9Height="16" ctype="ImageViewObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="-1390614073" Tag="325" RotationSkewX="0" RotationSkewY="0" LeftMargin="0.7099" RightMargin="-0.7099" TopMargin="0" BottomMargin="0" BackColorAlpha="75" Scale9Enable="True" LeftEage="-14" RightEage="-14" TopEage="-39" BottomEage="-39" Scale9OriginX="-14" Scale9OriginY="-39" Scale9Width="28" Scale9Height="78" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360.7099" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
            <Children>
              <AbstractNodeData Name="bottom_lay" ActionTag="-2054906598" Tag="13" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="1208.665527" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="71.334503" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="360" Y="0" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
              <AbstractNodeData Name="top_lay" ActionTag="-543684984" Tag="14" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="1208.665527" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="71.334503" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="1" />
                <Position X="360" Y="1280" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
              <AbstractNodeData Name="hero_draw_icon" ActionTag="-278156271" Tag="474" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="617" BottomMargin="617" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="640" />
                <Scale ScaleX="0.934" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="slider" ActionTag="1249904974" Tag="411" RotationSkewX="0" RotationSkewY="0" LeftMargin="60" RightMargin="60" TopMargin="1176" BottomMargin="92" TouchEnable="True" Alpha="249" ProgressInfo="3" ctype="SliderObjectData">
                <Size Y="12" X="600" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="98" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <BackGroundData Type="PlistSubImage" Path="hero_draw_04.png" Plist="resource/herodraw/herodraw.plist" />
                <ProgressBarData />
                <BallNormalData Type="PlistSubImage" Path="hero_draw_05.png" Plist="resource/herodraw/herodraw.plist" />
                <BallPressedData Type="Default" Path="Default/SliderNode_Press.png" Plist="" />
                <BallDisabledData Type="Default" Path="Default/SliderNode_Disable.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="delete_btn" ActionTag="-1626930677" Tag="444" RotationSkewX="0" RotationSkewY="0" LeftMargin="12" RightMargin="668" TopMargin="1157" BottomMargin="73" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="50" X="40" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="32" Y="98" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="img" ActionTag="319480116" Tag="437" RotationSkewX="0" RotationSkewY="0" LeftMargin="12" RightMargin="12" TopMargin="20.5" BottomMargin="20.5" LeftEage="5" RightEage="5" TopEage="2" BottomEage="2" Scale9OriginX="5" Scale9OriginY="2" Scale9Width="6" Scale9Height="5" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="9" X="16" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="20" Y="25" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hero_draw_01.png" Plist="resource/herodraw/herodraw.plist" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="add_btn" ActionTag="923702921" Tag="445" RotationSkewX="0" RotationSkewY="0" LeftMargin="668" RightMargin="12" TopMargin="1157" BottomMargin="73" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="50" X="40" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="688" Y="98" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="img" ActionTag="-692257002" Tag="440" RotationSkewX="0" RotationSkewY="0" LeftMargin="7" RightMargin="7" TopMargin="11.5" BottomMargin="11.5" LeftEage="5" RightEage="5" TopEage="2" BottomEage="2" Scale9OriginX="5" Scale9OriginY="2" Scale9Width="16" Scale9Height="23" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="27" X="26" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="20" Y="25" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hero_draw_02.png" Plist="resource/herodraw/herodraw.plist" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="close_btn" ActionTag="-966639110" Tag="447" RotationSkewX="0" RotationSkewY="0" LeftMargin="612.990723" RightMargin="47.0093" TopMargin="43.5261" BottomMargin="1176.473877" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="60" X="60" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="642.990723" Y="1206.473877" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="img" ActionTag="-322738820" Tag="442" RotationSkewX="0" RotationSkewY="0" LeftMargin="13" RightMargin="13" TopMargin="13" BottomMargin="13" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="4" Scale9Height="12" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                    <Size Y="34" X="34" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="30" Y="30" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <NormalFileData Type="PlistSubImage" Path="hero_draw_03.png" Plist="resource/herodraw/herodraw.plist" />
                    <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                    <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                    <TextColor A="255" B="70" G="65" R="65" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <FontResource />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="name" ActionTag="74767601" Tag="115" RotationSkewX="0" RotationSkewY="0" LeftMargin="24" RightMargin="491" TopMargin="1111.5" BottomMargin="131.5" FontSize="34" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="37" X="205" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="24" Y="150" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="23" G="55" R="82" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="story_btn" ActionTag="1224067808" Tag="25" RotationSkewX="0" RotationSkewY="0" LeftMargin="87" RightMargin="447" TopMargin="1206.359985" BottomMargin="11.64" TouchEnable="True" LeftEage="8" RightEage="8" TopEage="20" BottomEage="20" Scale9OriginX="8" Scale9OriginY="20" Scale9Width="30" Scale9Height="6" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="62" X="186" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="180" Y="42.639999" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="shard_preview_btn" ActionTag="-939164764" Tag="32" RotationSkewX="0" RotationSkewY="0" LeftMargin="447" RightMargin="87" TopMargin="1206.359985" BottomMargin="11.64" TouchEnable="True" LeftEage="8" RightEage="8" TopEage="20" BottomEage="20" Scale9OriginX="8" Scale9OriginY="20" Scale9Width="30" Scale9Height="6" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="62" X="186" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="540" Y="42.639999" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="shard_handle_panel" Visible="False" ActionTag="1487359451" Tag="39" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
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
                  <AbstractNodeData Name="confirm_btn" ActionTag="-1726822048" Tag="34" RotationSkewX="0" RotationSkewY="0" LeftMargin="447" RightMargin="87" TopMargin="1208" BottomMargin="10" TouchEnable="True" LeftEage="8" RightEage="8" TopEage="20" BottomEage="20" Scale9OriginX="8" Scale9OriginY="20" Scale9Width="170" Scale9Height="22" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="62" X="186" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="540" Y="41" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="txt_cn_hero_draw_02.png" Plist="resource/herodraw/herodraw.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="cancel_btn" ActionTag="301960097" Tag="30" RotationSkewX="0" RotationSkewY="0" LeftMargin="88" RightMargin="446" TopMargin="1208" BottomMargin="10" TouchEnable="True" LeftEage="8" RightEage="8" TopEage="20" BottomEage="20" Scale9OriginX="8" Scale9OriginY="20" Scale9Width="170" Scale9Height="22" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="62" X="186" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="181" Y="41" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="txt_cn_hero_draw_03.png" Plist="resource/herodraw/herodraw.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="erweima_container" Visible="False" ActionTag="1783632420" Tag="36" RotationSkewX="0" RotationSkewY="0" LeftMargin="561.000427" RightMargin="18.999599" TopMargin="1014.999878" BottomMargin="125.000099" TouchEnable="True" ComboBoxIndex="1" Scale9Enable="True" LeftEage="8" RightEage="8" TopEage="7" BottomEage="7" Scale9OriginX="8" Scale9OriginY="7" Scale9Width="9" Scale9Height="8" ctype="PanelObjectData">
                    <Size Y="140" X="140" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0" />
                    <Position X="631.000427" Y="125.000099" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="hero_draw_06.png" Plist="resource/herodraw/herodraw.plist" />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="255" R="255" />
                    <Children>
                      <AbstractNodeData Name="img" ActionTag="1598530523" Tag="37" RotationSkewX="0" RotationSkewY="0" LeftMargin="47" RightMargin="47" TopMargin="47" BottomMargin="47" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="70" Y="70" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="logo_container" Visible="False" ActionTag="-1116084435" Tag="151" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="477" TopMargin="0" BottomMargin="1125" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="155" X="243" />
                    <AnchorPoint ScaleX="0" ScaleY="1" />
                    <Position X="0" Y="1280" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="logo_img" ActionTag="1418315407" Tag="38" RotationSkewX="0" RotationSkewY="0" LeftMargin="13.0005" RightMargin="183.999496" TopMargin="0" BottomMargin="109" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0" ScaleY="1" />
                        <Position X="13.0005" Y="155" />
                        <Scale ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Sprite_1" ActionTag="1061351197" Tag="149" RotationSkewX="0" RotationSkewY="0" LeftMargin="106.5" RightMargin="106.5" TopMargin="140.5" BottomMargin="-14.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="29" X="30" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="121.5" Y="0" />
                        <Scale ScaleX="7.2" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="hero_draw_07.png" Plist="resource/herodraw/herodraw.plist" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="label" ActionTag="-533396558" Tag="150" RotationSkewX="0" RotationSkewY="0" LeftMargin="10" RightMargin="10" TopMargin="144" BottomMargin="-11" FontSize="20" LabelText="---" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="22" X="223" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="121.5" Y="0" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="21" G="49" R="77" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="0" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="score_image" ActionTag="-1092357053" Tag="264" RotationSkewX="0" RotationSkewY="0" LeftMargin="518.48999" RightMargin="81.510002" TopMargin="123.819901" BottomMargin="1051.180054" LeftEage="39" RightEage="39" TopEage="34" BottomEage="34" Scale9OriginX="39" Scale9OriginY="34" Scale9Width="42" Scale9Height="37" ctype="ImageViewObjectData">
                <Size Y="105" X="120" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="578.48999" Y="1103.680054" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="partnersummon_s.png" Plist="resource/partnersummon/partnersummon.plist" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
