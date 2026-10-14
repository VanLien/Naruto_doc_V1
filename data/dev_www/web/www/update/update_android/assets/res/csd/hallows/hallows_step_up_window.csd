<GameFile>
  <PropertyGroup Name="hallows_step_up_window" Type="Layer" ID="qgp4-l819mbs6vioa5k2dztjnyeuwrhc7fx3" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="15" Speed="1.000000">
        <Timeline ActionTag="2111974236" Property="Position">
          <PointFrame FrameIndex="0" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="7" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="12" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="15" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="2111974236" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.000000" Y="0.100000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="7" X="1.000000" Y="1.200000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="12" X="1.000000" Y="0.900000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="15" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="2111974236" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="7" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="12" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="15" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="2111974236" Property="FrameEvent">
          <EventFrame FrameIndex="15" Value="start_frame">
          </EventFrame>
        </Timeline>
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="134502456" Tag="221" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
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
          <AbstractNodeData Name="main_container" ActionTag="2111974236" Tag="211" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="430.5" BottomMargin="430.5" FrameEvent="start_frame" BackColorAlpha="102" Scale9Enable="True" LeftEage="18" RightEage="18" TopEage="18" BottomEage="18" Scale9OriginX="18" Scale9OriginY="18" Scale9Width="21" Scale9Height="21" ctype="PanelObjectData">
            <Size Y="419" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData Type="PlistSubImage" Path="common_1064.png" Plist="resource/common/common.plist" />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="Sprite_1" ActionTag="1843899153" Tag="212" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="0" BottomMargin="373" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="1" />
                <Position X="360" Y="419" />
                <Scale ScaleX="2.62" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_2" ActionTag="-1076085940" Tag="213" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="373" BottomMargin="0" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="360" Y="0" />
                <Scale ScaleX="2.62" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_3" ActionTag="-1256136377" Tag="214" RotationSkewX="0" RotationSkewY="0" LeftMargin="11.992" RightMargin="356.007996" TopMargin="409.500305" BottomMargin="-19.500299" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="29" X="352" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="187.992004" Y="-5.0003" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_30003.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_4" ActionTag="760395400" Tag="215" RotationSkewX="0" RotationSkewY="0" LeftMargin="364.000092" RightMargin="3.9999" TopMargin="409.5" BottomMargin="-19.5" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="29" X="352" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="540.000122" Y="-5" />
                <Scale ScaleX="-1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_30003.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_5" ActionTag="431691145" Tag="216" RotationSkewX="0" RotationSkewY="0" LeftMargin="536.987976" RightMargin="0.012" TopMargin="-25" BottomMargin="414" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="30" X="183" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="628.487976" Y="429" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_30002.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_6" ActionTag="554568355" Tag="217" RotationSkewX="0" RotationSkewY="0" LeftMargin="-183" RightMargin="720" TopMargin="-25" BottomMargin="414" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="30" X="183" />
                <AnchorPoint ScaleX="1" ScaleY="0.5" />
                <Position X="0" Y="429" />
                <Scale ScaleX="-1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_30002.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_13" ActionTag="-1132275570" Tag="222" RotationSkewX="0" RotationSkewY="0" LeftMargin="136" RightMargin="136" TopMargin="447.00061" BottomMargin="-64.000603" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="36" X="448" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="-46.000599" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="txt_cn_common_notice.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="Image_1" ActionTag="-1439002366" Tag="234" RotationSkewX="0" RotationSkewY="0" LeftMargin="-5" RightMargin="-5" TopMargin="220.997803" BottomMargin="44.002201" LeftEage="2" RightEage="2" TopEage="5" BottomEage="5" Scale9OriginX="2" Scale9OriginY="5" Scale9Width="5" Scale9Height="6" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="154" X="730" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="121.002197" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1091.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_29" ActionTag="1814667442" Tag="324" RotationSkewX="0" RotationSkewY="0" LeftMargin="316.5" RightMargin="316.5" TopMargin="141.499893" BottomMargin="224.500107" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="53" X="87" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="251.000107" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_30014.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="item_1" ActionTag="2060487386" Tag="294" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="250.498596" BottomMargin="125.501404" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="43" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="147.001404" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="Sprite_1" ActionTag="725143687" Tag="295" RotationSkewX="0" RotationSkewY="0" LeftMargin="285.5" RightMargin="285.5" TopMargin="0" BottomMargin="0" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="43" X="149" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="360" Y="21.5" />
                    <Scale ScaleX="4.9" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_90044.png" Plist="resource/common/common.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="arrow" ActionTag="-1305881709" Tag="296" RotationSkewX="0" RotationSkewY="0" LeftMargin="419.500702" RightMargin="265.499298" TopMargin="10" BottomMargin="10" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="23" X="35" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="437.000702" Y="21.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_90017.png" Plist="resource/common/common.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="title" ActionTag="-977372482" Tag="297" RotationSkewX="0" RotationSkewY="0" LeftMargin="207.000595" RightMargin="487.99939" TopMargin="6" BottomMargin="6" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="31" X="25" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="207.000595" Y="21.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="183" G="232" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="last_lev" ActionTag="-609047376" Tag="298" RotationSkewX="0" RotationSkewY="0" LeftMargin="287.002686" RightMargin="407.997314" TopMargin="6" BottomMargin="6" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="31" X="25" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="287.002686" Y="21.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="183" G="232" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="now_lev" ActionTag="191412719" Tag="299" RotationSkewX="0" RotationSkewY="0" LeftMargin="482.000214" RightMargin="212.999802" TopMargin="6" BottomMargin="6" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="31" X="25" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="482.000214" Y="21.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="50" G="251" R="20" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="item_2" ActionTag="-1782281913" Tag="288" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="302.498901" BottomMargin="73.501099" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="43" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="95.001099" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="Sprite_1" ActionTag="1201632948" Tag="289" RotationSkewX="0" RotationSkewY="0" LeftMargin="285.5" RightMargin="285.5" TopMargin="0" BottomMargin="0" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="43" X="149" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="360" Y="21.5" />
                    <Scale ScaleX="4.9" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_90044.png" Plist="resource/common/common.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="arrow" ActionTag="2037900017" Tag="290" RotationSkewX="0" RotationSkewY="0" LeftMargin="419.500702" RightMargin="265.499298" TopMargin="10" BottomMargin="10" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="23" X="35" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="437.000702" Y="21.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_90017.png" Plist="resource/common/common.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="title" ActionTag="-1833301658" Tag="291" RotationSkewX="0" RotationSkewY="0" LeftMargin="207.000595" RightMargin="487.99939" TopMargin="6" BottomMargin="6" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="31" X="25" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="207.000595" Y="21.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="183" G="232" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="last_lev" ActionTag="655729736" Tag="292" RotationSkewX="0" RotationSkewY="0" LeftMargin="287.002686" RightMargin="407.997314" TopMargin="6" BottomMargin="6" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="31" X="25" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="287.002686" Y="21.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="183" G="232" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="now_lev" ActionTag="-267303960" Tag="293" RotationSkewX="0" RotationSkewY="0" LeftMargin="482.000214" RightMargin="212.999802" TopMargin="6" BottomMargin="6" FontSize="24" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="31" X="25" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="482.000214" Y="21.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="50" G="251" R="20" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="hallows_name" ActionTag="566217522" Tag="323" RotationSkewX="0" RotationSkewY="0" LeftMargin="343" RightMargin="343" TopMargin="82.000198" BottomMargin="294.999786" FontSize="32" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="42" X="34" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="315.999786" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="111" G="243" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="old_step" ActionTag="764031618" Tag="325" RotationSkewX="0" RotationSkewY="0" LeftMargin="222.5345" RightMargin="466.465515" TopMargin="149.998993" BottomMargin="233.001007" FontSize="28" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="36" X="31" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="222.5345" Y="251.001007" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="183" G="232" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="cur_step" ActionTag="-1143311137" Tag="326" RotationSkewX="0" RotationSkewY="0" LeftMargin="442.828888" RightMargin="246.171097" TopMargin="149.998993" BottomMargin="233.001007" FontSize="28" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="36" X="31" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="442.828888" Y="251.001007" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="50" G="251" R="20" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
          <AbstractNodeData Name="title_container" ActionTag="1794172175" Tag="210" RotationSkewX="0" RotationSkewY="0" LeftMargin="260" RightMargin="260" TopMargin="401" BottomMargin="839" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="40" X="200" />
            <AnchorPoint ScaleX="0.5" ScaleY="0" />
            <Position X="360" Y="839" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
